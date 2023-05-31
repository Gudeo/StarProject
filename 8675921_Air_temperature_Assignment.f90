program temperature_conversion
  implicit none
  integer, parameter :: n = 30
  real :: temperature(n)
  integer :: g

  ! Open the input file
  open(unit=24, file='Air_temperature.csv', status='old')

  do g = 1, n
    ! Read the temperature values from the file
    read(24, *) temperature(g)
  end do

  ! Close the input file
  close(24)

  ! Convert the temperature values using the conversion function
  call convert_temperature(temperature, g)

  ! Open the output file
  open(unit=44, file='8675921_Air_temperature_Assignment.csv', status='replace')

  ! Write the header line to the output file
  write(44, *) 'Original Temperature (Celsius),Converted Temperature (Kelvin)'

  ! Write the converted temperature values to the output file
  do g= 1, n
    write(44, '( F6.2, ",", F10.2)') temperature(g) - 273.15, temperature(g)
  end do

  ! Close the output file
  close(44)

contains

  subroutine convert_temperature(temps, num)
    implicit none
    real, intent(inout) :: temps(:)
    integer, intent(in) :: num
    integer :: i

    do i = 1, num
      ! Convert the temperature from degrees Celsius to Kelvin
      temps(i) = temps(i) + 273.15
    end do

  end subroutine convert_temperature

end program temperature_conversion

