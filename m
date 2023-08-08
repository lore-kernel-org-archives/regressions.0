Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62A012B6C
	for <regressions@lists.linux.dev>; Tue,  8 Aug 2023 15:01:26 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-447684c4283so2000316137.2
        for <regressions@lists.linux.dev>; Tue, 08 Aug 2023 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691506885; x=1692111685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mW4Pxe0sh06J0lJl98FVWr1YtZ5v5YzRJ0LfEY0F5rY=;
        b=N2w72c6YzGl9V26tP/8oBSpM5nF1M7qr7hMcltgK+VsK28Mf4z82Nz8QHp+jcGPyka
         t2Po+cbNjh8sOO6el3D+3evFsM+u1kw0e1uRZrMvMGS4pN1qdMOrafcITJCq/PAiidSy
         fDjP1nFDFfTgyf/2EQZgXsvlHCiEAcr8mY5PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691506885; x=1692111685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mW4Pxe0sh06J0lJl98FVWr1YtZ5v5YzRJ0LfEY0F5rY=;
        b=fJFMScSCtfnvFbbW20438+AZpQ+F8AIBuQPjBJi0fYlWVVhCN1bdRT2uG1G3VdHu38
         e8lJ0uUL/LBhN5tM4UVq5lQCwbaYq7sL2kGUEF8JaV4qln1AkNfMqKDn/mr5wAL+CbjW
         QFMxpfKC/EoCxhq2o8Uh0b/Yxtka+RUUN3UOmguWEh91fgU4Mqd4AnaoOGyEJFyeTqyh
         lJcNVLECcGeMW6t+g8wFcXkjDJzaRvYw72tBcSAzhdAddH/YaxsaJGgL0lxSzCnFqKoA
         2LHNrc156kAxQCNeKSglx6UFUdIdvteXIUn+g5c0hQml5bdw3+0ffpt6vsz2nEjS6iAo
         0q+g==
X-Gm-Message-State: AOJu0YygX3B6IjmKflBdYos6F0izKovahGVqaTlwoITIc9O9RzDwiS8N
	mhRaMKj8bIjEaxB1BJmTLSx9xzQrGhM/txvczq0=
X-Google-Smtp-Source: AGHT+IGUZc7QHWNo4QDmwScYcsOrzWYEe/oSFX25XCR7JbJ7ZUUB1/Rm8cMvmJHiVDlXls/Fi9iU1Q==
X-Received: by 2002:a67:f604:0:b0:447:ba64:7e40 with SMTP id k4-20020a67f604000000b00447ba647e40mr87132vso.8.1691506884260;
        Tue, 08 Aug 2023 08:01:24 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id h29-20020a9f301d000000b0079b3282b5f5sm606542uab.2.2023.08.08.08.01.22
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 08:01:23 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-79a46f02d45so1602518241.0
        for <regressions@lists.linux.dev>; Tue, 08 Aug 2023 08:01:22 -0700 (PDT)
X-Received: by 2002:a05:6102:45b:b0:443:7516:450b with SMTP id
 e27-20020a056102045b00b004437516450bmr47529vsq.35.1691506881466; Tue, 08 Aug
 2023 08:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANWZPgK2+9SCavsbSZv1DfJyhy0XUpJZ6+ebatM9ZGJPpAN1yA@mail.gmail.com>
 <ZNGdYCXOHRqWnoeT@debian.me> <CANWZPgKAtbNRUy0pyL7Zf-S-zLeMkJZ7fSWpFO8__YG0_e2Zgw@mail.gmail.com>
In-Reply-To: <CANWZPgKAtbNRUy0pyL7Zf-S-zLeMkJZ7fSWpFO8__YG0_e2Zgw@mail.gmail.com>
From: Raul Rangel <rrangel@chromium.org>
Date: Tue, 8 Aug 2023 09:01:09 -0600
X-Gmail-Original-Message-ID: <CAHQZ30AhngEgVR-Hcjcze2HyZOG=4fbfp_S2=Or7JUJUUxm4mQ@mail.gmail.com>
Message-ID: <CAHQZ30AhngEgVR-Hcjcze2HyZOG=4fbfp_S2=Or7JUJUUxm4mQ@mail.gmail.com>
Subject: Re: atkbd input regression
To: =?UTF-8?B?Sm9zw6kgUmFtw7NuIE11w7FveiBQZWtrYXJpbmVu?= <koalinux@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-input@vger.kernel.org, 
	dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org, 
	Linux Regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2023 at 12:00=E2=80=AFAM Jos=C3=A9 Ram=C3=B3n Mu=C3=B1oz Pek=
karinen
<koalinux@gmail.com> wrote:
>
> On Tue, 8 Aug 2023 at 04:41, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >
> > On Mon, Aug 07, 2023 at 08:19:00AM +0300, Jos=C3=A9 Ram=C3=B3n Mu=C3=B1=
oz Pekkarinen wrote:
> > >     Sorry again, now in plaintext mode.
> > >
> > >     Hi,
> > >
> > >     I'd like to seek help or advise in a possible
> > > regression that I detected on my system(a
> > > Thinkpad L14 Gen 1) that concerns the atkbd
> > > module. My OS is a gentoo, with self built
> > > kernels, and a plasma desktop environment
> > > using wayland. Up to the kernel 5.16.x my
> > > builtin keyboard worked(and works still)
> > > fine both in tty and the plasma session, but
> > > from that kernel on, the keyboard works only
> > > in tty, and no longer in the plasma session.
> > >
> > >     The input config section of my 5.16.17 kernel:
> > >
> > > #
> > > # Input device support
> > > #
> > > CONFIG_INPUT=3Dy
> > > CONFIG_INPUT_LEDS=3Dm
> > > # CONFIG_INPUT_FF_MEMLESS is not set
> > > # CONFIG_INPUT_SPARSEKMAP is not set
> > > # CONFIG_INPUT_MATRIXKMAP is not set
> > >
> > > #
> > > # Userland interfaces
> > > #
> > > CONFIG_INPUT_MOUSEDEV=3Dm
> > > # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> > > CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> > > CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> > > CONFIG_INPUT_JOYDEV=3Dm
> > > CONFIG_INPUT_EVDEV=3Dm
> > > # CONFIG_INPUT_EVBUG is not set
> > >
> > > #
> > > # Input Device Drivers
> > > #
> > > CONFIG_INPUT_KEYBOARD=3Dy
> > > # CONFIG_KEYBOARD_ADP5588 is not set
> > > # CONFIG_KEYBOARD_ADP5589 is not set
> > > # CONFIG_KEYBOARD_APPLESPI is not set
> > > CONFIG_KEYBOARD_ATKBD=3Dy
> > > # CONFIG_KEYBOARD_QT1050 is not set
> > > # CONFIG_KEYBOARD_QT1070 is not set
> > > # CONFIG_KEYBOARD_QT2160 is not set
> > > # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> > > # CONFIG_KEYBOARD_LKKBD is not set
> > > # CONFIG_KEYBOARD_GPIO is not set
> > > # CONFIG_KEYBOARD_GPIO_POLLED is not set
> > > # CONFIG_KEYBOARD_TCA6416 is not set
> > > # CONFIG_KEYBOARD_TCA8418 is not set
> > > # CONFIG_KEYBOARD_MATRIX is not set
> > > # CONFIG_KEYBOARD_LM8323 is not set
> > > # CONFIG_KEYBOARD_LM8333 is not set
> > > # CONFIG_KEYBOARD_MAX7359 is not set
> > > # CONFIG_KEYBOARD_MCS is not set
> > > # CONFIG_KEYBOARD_MPR121 is not set
> > > # CONFIG_KEYBOARD_NEWTON is not set
> > > # CONFIG_KEYBOARD_OPENCORES is not set
> > > # CONFIG_KEYBOARD_SAMSUNG is not set
> > > # CONFIG_KEYBOARD_STOWAWAY is not set
> > > # CONFIG_KEYBOARD_SUNKBD is not set
> > > # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> > > # CONFIG_KEYBOARD_XTKBD is not set
> > > # CONFIG_KEYBOARD_CYPRESS_SF is not set
> > >
> > >     And the same for 6.4.7:
> > >
> > > #
> > > # Input device support
> > > #
> > > CONFIG_INPUT=3Dy
> > > CONFIG_INPUT_LEDS=3Dm
> > > # CONFIG_INPUT_FF_MEMLESS is not set
> > > # CONFIG_INPUT_SPARSEKMAP is not set
> > > # CONFIG_INPUT_MATRIXKMAP is not set
> > > CONFIG_INPUT_VIVALDIFMAP=3Dy
> > >
> > > #
> > > # Userland interfaces
> > > #
> > > CONFIG_INPUT_MOUSEDEV=3Dm
> > > # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> > > CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> > > CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> > > CONFIG_INPUT_JOYDEV=3Dm
> > > CONFIG_INPUT_EVDEV=3Dm
> > > # CONFIG_INPUT_EVBUG is not set
> > >
> > > #
> > > # Input Device Drivers
> > > #
> > > CONFIG_INPUT_KEYBOARD=3Dy
> > > # CONFIG_KEYBOARD_ADP5588 is not set
> > > # CONFIG_KEYBOARD_ADP5589 is not set
> > > # CONFIG_KEYBOARD_APPLESPI is not set
> > > CONFIG_KEYBOARD_ATKBD=3Dy
> > > # CONFIG_KEYBOARD_QT1050 is not set
> > > # CONFIG_KEYBOARD_QT1070 is not set
> > > # CONFIG_KEYBOARD_QT2160 is not set
> > > # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> > > # CONFIG_KEYBOARD_LKKBD is not set
> > > # CONFIG_KEYBOARD_GPIO is not set
> > > # CONFIG_KEYBOARD_GPIO_POLLED is not set
> > > # CONFIG_KEYBOARD_TCA6416 is not set
> > > # CONFIG_KEYBOARD_TCA8418 is not set
> > > # CONFIG_KEYBOARD_MATRIX is not set
> > > # CONFIG_KEYBOARD_LM8323 is not set
> > > # CONFIG_KEYBOARD_LM8333 is not set
> > > # CONFIG_KEYBOARD_MAX7359 is not set
> > > # CONFIG_KEYBOARD_MCS is not set
> > > # CONFIG_KEYBOARD_MPR121 is not set
> > > # CONFIG_KEYBOARD_NEWTON is not set
> > > # CONFIG_KEYBOARD_OPENCORES is not set
> > > # CONFIG_KEYBOARD_PINEPHONE is not set
> > > # CONFIG_KEYBOARD_SAMSUNG is not set
> > > # CONFIG_KEYBOARD_STOWAWAY is not set
> > > # CONFIG_KEYBOARD_SUNKBD is not set
> > > # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> > > # CONFIG_KEYBOARD_XTKBD is not set
> > > # CONFIG_KEYBOARD_CYPRESS_SF is not set
> > >
> > >     If I run evtest, the keyboard is detected, and I can
> > > retrieve its events. From my kernel 6.4, this is an
> > > example of it's output.
> > >
> > > # evtest
> > > No device specified, trying to scan all of /dev/input/event*
> > > Available devices:
> > > /dev/input/event0:      AT Translated Set 2 keyboard
> > > /dev/input/event1:      Power Button
> > > /dev/input/event10:     SEM HCT Keyboard Consumer Control
> > > /dev/input/event11:     SEM HCT Keyboard System Control
> > > /dev/input/event12:     Logitech USB Optical Mouse
> > > /dev/input/event2:      Lid Switch
> > > /dev/input/event3:      Sleep Button
> > > /dev/input/event4:      Power Button
> > > /dev/input/event5:      Video Bus
> > > /dev/input/event6:      ThinkPad Extra Buttons
> > > /dev/input/event7:      SynPS/2 Synaptics TouchPad
> > > /dev/input/event8:      TPPS/2 Elan TrackPoint
> > > /dev/input/event9:      SEM HCT Keyboard
> > > Select the device event number [0-12]: 0
> > > Input driver version is 1.0.1
> > > Input device ID: bus 0x11 vendor 0x1 product 0x1 version 0xab54
> > > Input device name: "AT Translated Set 2 keyboard"
> > > Supported events:
> > >  Event type 0 (EV_SYN)
> > >  Event type 1 (EV_KEY)
> > >    Event code 1 (KEY_ESC)
> > >    Event code 2 (KEY_1)
> > >    Event code 3 (KEY_2)
> > >    Event code 4 (KEY_3)
> > >    Event code 5 (KEY_4)
> > >    Event code 6 (KEY_5)
> > >    Event code 7 (KEY_6)
> > >    Event code 8 (KEY_7)
> > >    Event code 9 (KEY_8)
> > >    Event code 10 (KEY_9)
> > >    Event code 11 (KEY_0)
> > >    Event code 12 (KEY_MINUS)
> > >    Event code 13 (KEY_EQUAL)
> > >    Event code 14 (KEY_BACKSPACE)
> > >    Event code 15 (KEY_TAB)
> > >    Event code 16 (KEY_Q)
> > >    Event code 17 (KEY_W)
> > >    Event code 18 (KEY_E)
> > >    Event code 19 (KEY_R)
> > >    Event code 20 (KEY_T)
> > >    Event code 21 (KEY_Y)
> > >    Event code 22 (KEY_U)
> > >    Event code 23 (KEY_I)
> > >    Event code 24 (KEY_O)
> > >    Event code 25 (KEY_P)
> > >    Event code 26 (KEY_LEFTBRACE)
> > >    Event code 27 (KEY_RIGHTBRACE)
> > >    Event code 28 (KEY_ENTER)
> > >    Event code 29 (KEY_LEFTCTRL)
> > >    Event code 30 (KEY_A)
> > >    Event code 31 (KEY_S)
> > >    Event code 32 (KEY_D)
> > >    Event code 33 (KEY_F)
> > >    Event code 34 (KEY_G)
> > >    Event code 35 (KEY_H)
> > >    Event code 36 (KEY_J)
> > >    Event code 37 (KEY_K)
> > >    Event code 38 (KEY_L)
> > >    Event code 39 (KEY_SEMICOLON)
> > >    Event code 40 (KEY_APOSTROPHE)
> > >    Event code 41 (KEY_GRAVE)
> > >    Event code 42 (KEY_LEFTSHIFT)
> > >    Event code 43 (KEY_BACKSLASH)
> > >    Event code 44 (KEY_Z)
> > >    Event code 45 (KEY_X)
> > >    Event code 46 (KEY_C)
> > >    Event code 47 (KEY_V)
> > >    Event code 48 (KEY_B)
> > >    Event code 49 (KEY_N)
> > >    Event code 50 (KEY_M)
> > >    Event code 51 (KEY_COMMA)
> > >    Event code 52 (KEY_DOT)
> > >    Event code 53 (KEY_SLASH)
> > >    Event code 54 (KEY_RIGHTSHIFT)
> > >    Event code 55 (KEY_KPASTERISK)
> > >    Event code 56 (KEY_LEFTALT)
> > >    Event code 57 (KEY_SPACE)
> > >    Event code 58 (KEY_CAPSLOCK)
> > >    Event code 59 (KEY_F1)
> > >    Event code 60 (KEY_F2)
> > >    Event code 61 (KEY_F3)
> > >    Event code 62 (KEY_F4)
> > >    Event code 63 (KEY_F5)
> > >    Event code 64 (KEY_F6)
> > >    Event code 65 (KEY_F7)
> > >    Event code 66 (KEY_F8)
> > >    Event code 67 (KEY_F9)
> > >    Event code 68 (KEY_F10)
> > >    Event code 69 (KEY_NUMLOCK)
> > >    Event code 70 (KEY_SCROLLLOCK)
> > >    Event code 71 (KEY_KP7)
> > >    Event code 72 (KEY_KP8)
> > >    Event code 73 (KEY_KP9)
> > >    Event code 74 (KEY_KPMINUS)
> > >    Event code 75 (KEY_KP4)
> > >    Event code 76 (KEY_KP5)
> > >    Event code 77 (KEY_KP6)
> > >    Event code 78 (KEY_KPPLUS)
> > >    Event code 79 (KEY_KP1)
> > >    Event code 80 (KEY_KP2)
> > >    Event code 81 (KEY_KP3)
> > >    Event code 82 (KEY_KP0)
> > >    Event code 83 (KEY_KPDOT)
> > >    Event code 85 (KEY_ZENKAKUHANKAKU)
> > >    Event code 86 (KEY_102ND)
> > >    Event code 87 (KEY_F11)
> > >    Event code 88 (KEY_F12)
> > >    Event code 89 (KEY_RO)
> > >    Event code 90 (KEY_KATAKANA)
> > >    Event code 91 (KEY_HIRAGANA)
> > >    Event code 92 (KEY_HENKAN)
> > >    Event code 93 (KEY_KATAKANAHIRAGANA)
> > >    Event code 94 (KEY_MUHENKAN)
> > >    Event code 95 (KEY_KPJPCOMMA)
> > >    Event code 96 (KEY_KPENTER)
> > >    Event code 97 (KEY_RIGHTCTRL)
> > >    Event code 98 (KEY_KPSLASH)
> > >    Event code 99 (KEY_SYSRQ)
> > >    Event code 100 (KEY_RIGHTALT)
> > >    Event code 102 (KEY_HOME)
> > >    Event code 103 (KEY_UP)
> > >    Event code 104 (KEY_PAGEUP)
> > >    Event code 105 (KEY_LEFT)
> > >    Event code 106 (KEY_RIGHT)
> > >    Event code 107 (KEY_END)
> > >    Event code 108 (KEY_DOWN)
> > >    Event code 109 (KEY_PAGEDOWN)
> > >    Event code 110 (KEY_INSERT)
> > >    Event code 111 (KEY_DELETE)
> > >    Event code 112 (KEY_MACRO)
> > >    Event code 113 (KEY_MUTE)
> > >    Event code 114 (KEY_VOLUMEDOWN)
> > >    Event code 115 (KEY_VOLUMEUP)
> > >    Event code 116 (KEY_POWER)
> > >    Event code 117 (KEY_KPEQUAL)
> > >    Event code 118 (KEY_KPPLUSMINUS)
> > >    Event code 119 (KEY_PAUSE)
> > >    Event code 121 (KEY_KPCOMMA)
> > >    Event code 122 (KEY_HANGUEL)
> > >    Event code 123 (KEY_HANJA)
> > >    Event code 124 (KEY_YEN)
> > >    Event code 125 (KEY_LEFTMETA)
> > >    Event code 126 (KEY_RIGHTMETA)
> > >    Event code 127 (KEY_COMPOSE)
> > >    Event code 128 (KEY_STOP)
> > >    Event code 140 (KEY_CALC)
> > >    Event code 142 (KEY_SLEEP)
> > >    Event code 143 (KEY_WAKEUP)
> > >    Event code 155 (KEY_MAIL)
> > >    Event code 156 (KEY_BOOKMARKS)
> > >    Event code 157 (KEY_COMPUTER)
> > >    Event code 158 (KEY_BACK)
> > >    Event code 159 (KEY_FORWARD)
> > >    Event code 163 (KEY_NEXTSONG)
> > >    Event code 164 (KEY_PLAYPAUSE)
> > >    Event code 165 (KEY_PREVIOUSSONG)
> > >    Event code 166 (KEY_STOPCD)
> > >    Event code 172 (KEY_HOMEPAGE)
> > >    Event code 173 (KEY_REFRESH)
> > >    Event code 183 (KEY_F13)
> > >    Event code 184 (KEY_F14)
> > >    Event code 185 (KEY_F15)
> > >    Event code 217 (KEY_SEARCH)
> > >    Event code 226 (KEY_MEDIA)
> > >  Event type 4 (EV_MSC)
> > >    Event code 4 (MSC_SCAN)
> > >  Event type 17 (EV_LED)
> > >    Event code 0 (LED_NUML) state 0
> > >    Event code 1 (LED_CAPSL) state 0
> > >    Event code 2 (LED_SCROLLL) state 0
> > > Key repeat handling:
> > >  Repeat type 20 (EV_REP)
> > >    Repeat code 0 (REP_DELAY)
> > >      Value    250
> > >    Repeat code 1 (REP_PERIOD)
> > >      Value     33
> > > Properties:
> > > Testing ... (interrupt to exit)
> > > Event: time 1691384520.078772, type 4 (EV_MSC), code 4 (MSC_SCAN), va=
lue 10
> > > Event: time 1691384520.078772, type 1 (EV_KEY), code 16 (KEY_Q), valu=
e 1
> > > Event: time 1691384520.078772, -------------- SYN_REPORT ------------
> > > Event: time 1691384520.157298, type 4 (EV_MSC), code 4 (MSC_SCAN), va=
lue 10
> > > Event: time 1691384520.157298, type 1 (EV_KEY), code 16 (KEY_Q), valu=
e 0
> > > Event: time 1691384520.157298, -------------- SYN_REPORT ------------
> > > Event: time 1691384520.849991, type 4 (EV_MSC), code 4 (MSC_SCAN), va=
lue 11
> > > Event: time 1691384520.849991, type 1 (EV_KEY), code 17 (KEY_W), valu=
e 1
> > > Event: time 1691384520.849991, -------------- SYN_REPORT ------------
> > > Event: time 1691384520.919630, type 4 (EV_MSC), code 4 (MSC_SCAN), va=
lue 11
> > > Event: time 1691384520.919630, type 1 (EV_KEY), code 17 (KEY_W), valu=
e 0
> > > Event: time 1691384520.919630, -------------- SYN_REPORT ------------
> > > Event: time 1691384521.311986, type 4 (EV_MSC), code 4 (MSC_SCAN), va=
lue 12
> > > Event: time 1691384521.311986, type 1 (EV_KEY), code 18 (KEY_E), valu=
e 1
> > > Event: time 1691384521.311986, -------------- SYN_REPORT ------------
> > > Event: time 1691384521.417578, type 4 (EV_MSC), code 4 (MSC_SCAN), va=
lue 12
> > > Event: time 1691384521.417578, type 1 (EV_KEY), code 18 (KEY_E), valu=
e 0
> > > Event: time 1691384521.417578, -------------- SYN_REPORT ------------
> > > Event: time 1691384521.639505, type 4 (EV_MSC), code 4 (MSC_SCAN), va=
lue 13
> > > Event: time 1691384521.639505, type 1 (EV_KEY), code 19 (KEY_R), valu=
e 1
> > > Event: time 1691384521.639505, -------------- SYN_REPORT ------------
> > > Event: time 1691384521.709170, type 4 (EV_MSC), code 4 (MSC_SCAN), va=
lue 13
> > > Event: time 1691384521.709170, type 1 (EV_KEY), code 19 (KEY_R), valu=
e 0
> > > Event: time 1691384521.709170, -------------- SYN_REPORT ------------
> > > Event: time 1691384521.879657, type 4 (EV_MSC), code 4 (MSC_SCAN), va=
lue 14
> > > Event: time 1691384521.879657, type 1 (EV_KEY), code 20 (KEY_T), valu=
e 1
> > > Event: time 1691384521.879657, -------------- SYN_REPORT ------------
> > > Event: time 1691384521.958384, type 4 (EV_MSC), code 4 (MSC_SCAN), va=
lue 14
> > > Event: time 1691384521.958384, type 1 (EV_KEY), code 20 (KEY_T), valu=
e 0
> > > Event: time 1691384521.958384, -------------- SYN_REPORT ------------
> > > Event: time 1691384522.188556, type 4 (EV_MSC), code 4 (MSC_SCAN), va=
lue 15
> > > Event: time 1691384522.188556, type 1 (EV_KEY), code 21 (KEY_Y), valu=
e 1
> > >
> > >     I have reported this time ago in libinput, and they
> > > replied it might be a kernel problem, since booting
> > > my kernel 5.16 makes it work correctly again anytime.
> > >
> > >    Could anyone please shed some light on this little
> > > problem?
> >
> > You also missed dmesg output (from both v5.16.y and v6.4.y).
> >
> > Thorsten also asked you to bisect. Since you're on Gentoo, there is
> > a wiki article on this [1]. To narrow the bisection range, let me ask t=
his
> > question: Does v6.1 kernel have this regression? What about v5.17? In a=
ny case,
> > the kernel documentation also have howto on building custom kernel with=
 trimmed
> > config [2].
> >
> > Anyway, I'm adding this regression to be tracked by regzbot:
> >
> > #regzbot ^introduced: v5.16..v6.4
> > #regzbot title: Thinkpad L14 Gen 1 keyboard not working on Plasma sessi=
on
> >
> > Thanks.
> >
> > [1]: https://wiki.gentoo.org/wiki/Kernel_git-bisect
> > [2]: https://www.kernel.org/doc/html/latest/admin-guide/quickly-build-t=
rimmed-linux.html
> >
> > --
> > An old man doll... just what I always wanted! - Clara
>
>     Thanks for the extra help, here is the dmesg output of
> my working kernel:
>
> [    0.000000] Linux version 5.16.17-hardened1-x86_64
> (root@woodpecker) (x86_64-pc-linux-gnu-gcc (Gentoo Hardened
> 11.2.1_p20220115 p4) 11.2.1 20220115, GNU ld (Gentoo 2.37_p1 p2) 2.37)
> #1 SMP PREEMPT Mon Mar 28 19:00:13 EEST 2022
> [    0.000000] Kernel is locked down from Kernel configuration; see
> man kernel_lockdown.7
> [    0.000000] Command line:
> BOOT_IMAGE=3D/boot/vmlinuz-5.16.17-hardened1-x86_64
> root=3D/dev/mapper/vg0-root ro real_root=3D/dev/vg0/root dolvm
> crypt_root=3D/dev/nvme0n1p2 tsc=3Dunstable ima_policy=3Dappraise_tcb
> ima_appraise=3Dfix enforcing=3D0 default_hugepagesz=3D1G hugepagesz=3D1G
> hugepages=3D12 crashkernel=3D256M
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating
> point registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is
> 832 bytes, using 'compacted' format.
> [    0.000000] signal: max sigframe size: 1776
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009bfffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000009c00000-0x0000000009d20fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000009d21000-0x0000000009efffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000009f00000-0x0000000009f0ffff] ACP=
I NVS
> [    0.000000] BIOS-e820: [mem 0x0000000009f10000-0x00000000c70b7fff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x00000000c70b8000-0x00000000c72b7fff] typ=
e 20
> [    0.000000] BIOS-e820: [mem 0x00000000c72b8000-0x00000000ca97dfff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000ca97e000-0x00000000cc97dfff] ACP=
I NVS
> [    0.000000] BIOS-e820: [mem 0x00000000cc97e000-0x00000000cc9fdfff] ACP=
I data
> [    0.000000] BIOS-e820: [mem 0x00000000cc9fe000-0x00000000cdffffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x00000000ce000000-0x00000000cfffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fdd00000-0x00000000fddfffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed80fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000080f33ffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000080f340000-0x000000082fffffff] res=
erved
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] efi: EFI v2.70 by Lenovo
> [    0.000000] efi: ACPI=3D0xcc9fd000 ACPI 2.0=3D0xcc9fd014
> SMBIOS=3D0xc8895000 SMBIOS 3.0=3D0xc8888000 TPMFinalLog=3D0xcc82d000
> MEMATTR=3D0xc4123298 ESRT=3D0xc75b5000
> [    0.000000] SMBIOS 3.2.0 present.
> [    0.000000] DMI: LENOVO 20U50001MX/20U50001MX, BIOS R19ET43W (1.27
> ) 06/27/2022
> [    0.000000] tsc: Fast TSC calibration using PIT
> [    0.000000] tsc: Detected 1696.829 MHz processor
> [    0.000010] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000012] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000017] last_pfn =3D 0x80f340 max_arch_pfn =3D 0x400000000
> [    0.000177] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- =
WT
> [    0.000518] last_pfn =3D 0xce000 max_arch_pfn =3D 0x400000000
> [    0.003723] esrt: Reserving ESRT space from 0x00000000c75b5000 to
> 0x00000000c75b50b0.
> [    0.003735] Using GB pages for direct mapping
> [    0.004017] Secure boot disabled
> [    0.004018] RAMDISK: [mem 0x3716d000-0x378adfff]
> [    0.004021] ACPI: Early table checksum verification disabled
> [    0.004024] ACPI: RSDP 0x00000000CC9FD014 000024 (v02 LENOVO)
> [    0.004028] ACPI: XSDT 0x00000000CC9FB188 0000FC (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004033] ACPI: FACP 0x00000000C75E4000 000114 (v06 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004037] ACPI: DSDT 0x00000000C75CF000 00EC08 (v01 LENOVO TP-R19
>   00001270 INTL 20180313)
> [    0.004040] ACPI: FACS 0x00000000CBF7A000 000040
> [    0.004042] ACPI: SSDT 0x00000000C889C000 00077C (v02 LENOVO
> UsbCTabl 00001000 INTL 20180313)
> [    0.004044] ACPI: SSDT 0x00000000C8874000 00723C (v02 LENOVO TP-R19
>   00000002 MSFT 04000000)
> [    0.004046] ACPI: IVRS 0x00000000C8873000 0001A4 (v02 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004049] ACPI: SSDT 0x00000000C884E000 000266 (v01 LENOVO STD3
>   00000001 INTL 20180313)
> [    0.004051] ACPI: SSDT 0x00000000C883A000 00064C (v02 LENOVO
> Tpm2Tabl 00001000 INTL 20180313)
> [    0.004053] ACPI: TPM2 0x00000000C8839000 000034 (v03 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004056] ACPI: MSDM 0x00000000C8801000 000055 (v03 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004058] ACPI: BATB 0x00000000C87EB000 00004A (v02 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004060] ACPI: HPET 0x00000000C75E3000 000038 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004063] ACPI: APIC 0x00000000C75E2000 000138 (v02 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004065] ACPI: MCFG 0x00000000C75E1000 00003C (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004067] ACPI: SBST 0x00000000C75E0000 000030 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004069] ACPI: WSMT 0x00000000C75DF000 000028 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004072] ACPI: SSDT 0x00000000C75DE000 000083 (v02 LENOVO
> PID0Ssdt 00000010 INTL 20180313)
> [    0.004074] ACPI: VFCT 0x00000000C75C1000 00D684 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004076] ACPI: SSDT 0x00000000C75BD000 0039F4 (v01 LENOVO TP-R19
>   00000001 AMD  00000001)
> [    0.004079] ACPI: CRAT 0x00000000C75BC000 000F00 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004081] ACPI: CDIT 0x00000000C75BB000 000029 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004083] ACPI: FPDT 0x00000000C8813000 000034 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004085] ACPI: SSDT 0x00000000C75BA000 000149 (v01 LENOVO TP-R19
>   00000001 INTL 20180313)
> [    0.004088] ACPI: SSDT 0x00000000C75B8000 001497 (v01 LENOVO TP-R19
>   00000001 INTL 20180313)
> [    0.004090] ACPI: SSDT 0x00000000C75B6000 001576 (v01 LENOVO TP-R19
>   00000001 INTL 20180313)
> [    0.004092] ACPI: SSDT 0x00000000C75B1000 00353C (v01 LENOVO TP-R19
>   00000001 INTL 20180313)
> [    0.004094] ACPI: UEFI 0x00000000CBF79000 000116 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004097] ACPI: SSDT 0x00000000C889A000 000090 (v01 LENOVO TP-R19
>   00000001 INTL 20180313)
> [    0.004099] ACPI: SSDT 0x00000000C8899000 0009AD (v01 LENOVO TP-R19
>   00000001 INTL 20180313)
> [    0.004101] ACPI: Reserving FACP table memory at [mem 0xc75e4000-0xc75=
e4113]
> [    0.004102] ACPI: Reserving DSDT table memory at [mem 0xc75cf000-0xc75=
ddc07]
> [    0.004103] ACPI: Reserving FACS table memory at [mem 0xcbf7a000-0xcbf=
7a03f]
> [    0.004104] ACPI: Reserving SSDT table memory at [mem 0xc889c000-0xc88=
9c77b]
> [    0.004105] ACPI: Reserving SSDT table memory at [mem 0xc8874000-0xc88=
7b23b]
> [    0.004106] ACPI: Reserving IVRS table memory at [mem 0xc8873000-0xc88=
731a3]
> [    0.004107] ACPI: Reserving SSDT table memory at [mem 0xc884e000-0xc88=
4e265]
> [    0.004108] ACPI: Reserving SSDT table memory at [mem 0xc883a000-0xc88=
3a64b]
> [    0.004109] ACPI: Reserving TPM2 table memory at [mem 0xc8839000-0xc88=
39033]
> [    0.004109] ACPI: Reserving MSDM table memory at [mem 0xc8801000-0xc88=
01054]
> [    0.004110] ACPI: Reserving BATB table memory at [mem 0xc87eb000-0xc87=
eb049]
> [    0.004111] ACPI: Reserving HPET table memory at [mem 0xc75e3000-0xc75=
e3037]
> [    0.004112] ACPI: Reserving APIC table memory at [mem 0xc75e2000-0xc75=
e2137]
> [    0.004113] ACPI: Reserving MCFG table memory at [mem 0xc75e1000-0xc75=
e103b]
> [    0.004114] ACPI: Reserving SBST table memory at [mem 0xc75e0000-0xc75=
e002f]
> [    0.004115] ACPI: Reserving WSMT table memory at [mem 0xc75df000-0xc75=
df027]
> [    0.004116] ACPI: Reserving SSDT table memory at [mem 0xc75de000-0xc75=
de082]
> [    0.004117] ACPI: Reserving VFCT table memory at [mem 0xc75c1000-0xc75=
ce683]
> [    0.004118] ACPI: Reserving SSDT table memory at [mem 0xc75bd000-0xc75=
c09f3]
> [    0.004119] ACPI: Reserving CRAT table memory at [mem 0xc75bc000-0xc75=
bceff]
> [    0.004120] ACPI: Reserving CDIT table memory at [mem 0xc75bb000-0xc75=
bb028]
> [    0.004121] ACPI: Reserving FPDT table memory at [mem 0xc8813000-0xc88=
13033]
> [    0.004122] ACPI: Reserving SSDT table memory at [mem 0xc75ba000-0xc75=
ba148]
> [    0.004122] ACPI: Reserving SSDT table memory at [mem 0xc75b8000-0xc75=
b9496]
> [    0.004123] ACPI: Reserving SSDT table memory at [mem 0xc75b6000-0xc75=
b7575]
> [    0.004124] ACPI: Reserving SSDT table memory at [mem 0xc75b1000-0xc75=
b453b]
> [    0.004125] ACPI: Reserving UEFI table memory at [mem 0xcbf79000-0xcbf=
79115]
> [    0.004126] ACPI: Reserving SSDT table memory at [mem 0xc889a000-0xc88=
9a08f]
> [    0.004127] ACPI: Reserving SSDT table memory at [mem 0xc8899000-0xc88=
999ac]
> [    0.004147] Reserving 256MB of memory at 2880MB for crashkernel
> (System RAM: 32120MB)
> [    0.065178] Zone ranges:
> [    0.065182]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.065184]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [    0.065185]   Normal   [mem 0x0000000100000000-0x000000080f33ffff]
> [    0.065187]   Device   empty
> [    0.065188] Movable zone start for each node
> [    0.065188] Early memory node ranges
> [    0.065189]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> [    0.065191]   node   0: [mem 0x0000000000100000-0x0000000009bfffff]
> [    0.065192]   node   0: [mem 0x0000000009d21000-0x0000000009efffff]
> [    0.065192]   node   0: [mem 0x0000000009f10000-0x00000000c70b7fff]
> [    0.065194]   node   0: [mem 0x00000000cc9fe000-0x00000000cdffffff]
> [    0.065194]   node   0: [mem 0x0000000100000000-0x000000080f33ffff]
> [    0.065198] Initmem setup node 0 [mem 0x0000000000001000-0x000000080f3=
3ffff]
> [    0.065205] On node 0, zone DMA: 1 pages in unavailable ranges
> [    0.065238] On node 0, zone DMA: 97 pages in unavailable ranges
> [    0.065574] On node 0, zone DMA32: 289 pages in unavailable ranges
> [    0.072372] On node 0, zone DMA32: 16 pages in unavailable ranges
> [    0.072642] On node 0, zone DMA32: 22854 pages in unavailable ranges
> [    0.073041] On node 0, zone Normal: 8192 pages in unavailable ranges
> [    0.073070] On node 0, zone Normal: 3264 pages in unavailable ranges
> [    0.073515] ACPI: PM-Timer IO Port: 0x408
> [    0.073523] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
> [    0.073525] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
> [    0.073525] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
> [    0.073526] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
> [    0.073527] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
> [    0.073528] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
> [    0.073529] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
> [    0.073529] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
> [    0.073530] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
> [    0.073531] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
> [    0.073532] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
> [    0.073533] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
> [    0.073533] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
> [    0.073534] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
> [    0.073535] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
> [    0.073536] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
> [    0.073549] IOAPIC[0]: apic_id 32, version 33, address 0xfec00000, GSI=
 0-23
> [    0.073554] IOAPIC[1]: apic_id 33, version 33, address 0xfec01000, GSI=
 24-55
> [    0.073556] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.073557] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
> [    0.073561] ACPI: Using ACPI (MADT) for SMP configuration information
> [    0.073562] ACPI: HPET id: 0x43538210 base: 0xfed00000
> [    0.073568] smpboot: Allowing 16 CPUs, 0 hotplug CPUs
> [    0.073591] PM: hibernation: Registered nosave memory: [mem
> 0x00000000-0x00000fff]
> [    0.073594] PM: hibernation: Registered nosave memory: [mem
> 0x0009f000-0x0009ffff]
> [    0.073595] PM: hibernation: Registered nosave memory: [mem
> 0x000a0000-0x000dffff]
> [    0.073595] PM: hibernation: Registered nosave memory: [mem
> 0x000e0000-0x000fffff]
> [    0.073597] PM: hibernation: Registered nosave memory: [mem
> 0x09c00000-0x09d20fff]
> [    0.073599] PM: hibernation: Registered nosave memory: [mem
> 0x09f00000-0x09f0ffff]
> [    0.073601] PM: hibernation: Registered nosave memory: [mem
> 0xc70b8000-0xc72b7fff]
> [    0.073602] PM: hibernation: Registered nosave memory: [mem
> 0xc72b8000-0xca97dfff]
> [    0.073603] PM: hibernation: Registered nosave memory: [mem
> 0xca97e000-0xcc97dfff]
> [    0.073603] PM: hibernation: Registered nosave memory: [mem
> 0xcc97e000-0xcc9fdfff]
> [    0.073605] PM: hibernation: Registered nosave memory: [mem
> 0xce000000-0xcfffffff]
> [    0.073606] PM: hibernation: Registered nosave memory: [mem
> 0xd0000000-0xf7ffffff]
> [    0.073607] PM: hibernation: Registered nosave memory: [mem
> 0xf8000000-0xfbffffff]
> [    0.073607] PM: hibernation: Registered nosave memory: [mem
> 0xfc000000-0xfdcfffff]
> [    0.073608] PM: hibernation: Registered nosave memory: [mem
> 0xfdd00000-0xfddfffff]
> [    0.073609] PM: hibernation: Registered nosave memory: [mem
> 0xfde00000-0xfed7ffff]
> [    0.073610] PM: hibernation: Registered nosave memory: [mem
> 0xfed80000-0xfed80fff]
> [    0.073610] PM: hibernation: Registered nosave memory: [mem
> 0xfed81000-0xffffffff]
> [    0.073612] [mem 0xd0000000-0xf7ffffff] available for PCI devices
> [    0.073614] Booting paravirtualized kernel on bare hardware
> [    0.073617] clocksource: refined-jiffies: mask: 0xffffffff
> max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
> [    0.076511] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:16
> nr_cpu_ids:16 nr_node_ids:1
> [    0.077138] percpu: Embedded 59 pages/cpu s204800 r8192 d28672 u262144
> [    0.077148] pcpu-alloc: s204800 r8192 d28672 u262144 alloc=3D1*2097152
> [    0.077150] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11
> 12 13 14 15
> [    0.077185] Built 1 zonelists, mobility grouping on.  Total pages: 809=
4181
> [    0.077187] Kernel command line:
> BOOT_IMAGE=3D/boot/vmlinuz-5.16.17-hardened1-x86_64
> root=3D/dev/mapper/vg0-root ro real_root=3D/dev/vg0/root dolvm
> crypt_root=3D/dev/nvme0n1p2 tsc=3Dunstable ima_policy=3Dappraise_tcb
> ima_appraise=3Dfix enforcing=3D0 default_hugepagesz=3D1G hugepagesz=3D1G
> hugepages=3D12 crashkernel=3D256M
> [    0.077234] tsc: Marking TSC unstable due to boot parameter
> [    0.077301] Unknown kernel command line parameters "dolvm
> BOOT_IMAGE=3D/boot/vmlinuz-5.16.17-hardened1-x86_64
> real_root=3D/dev/vg0/root crypt_root=3D/dev/nvme0n1p2", will be passed to
> user space.
> [    0.077303] printk: log_buf_len individual max cpu contribution: 32768=
 bytes
> [    0.077304] printk: log_buf_len total cpu_extra contributions: 491520 =
bytes
> [    0.077305] printk: log_buf_len min size: 262144 bytes
> [    0.077985] printk: log_buf_len: 1048576 bytes
> [    0.077988] printk: early log buf free: 248088(94%)
> [    0.081711] Dentry cache hash table entries: 4194304 (order: 13,
> 33554432 bytes, linear)
> [    0.083551] Inode-cache hash table entries: 2097152 (order: 12,
> 16777216 bytes, linear)
> [    0.083601] mem auto-init: stack:byref(zero), heap alloc:on, heap free=
:on
> [    0.083602] mem auto-init: clearing system memory may take some time..=
.
> [    0.487819] Memory: 3011924K/32891292K available (12295K kernel
> code, 2880K rwdata, 5384K rodata, 2080K init, 3760K bss, 13558344K
> reserved, 0K cma-reserved)
> [    0.487828] random: get_random_u64 called from
> __kmem_cache_create+0x26/0x4f0 with crng_init=3D0
> [    0.487976] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D16=
, Nodes=3D1
> [    0.487990] ftrace: allocating 34111 entries in 134 pages
> [    0.497155] ftrace: allocated 134 pages with 3 groups
> [    0.497634] Dynamic Preempt: voluntary
> [    0.497672] rcu: Preemptible hierarchical RCU implementation.
> [    0.497673] rcu:     RCU restricting CPUs from NR_CPUS=3D8192 to nr_cp=
u_ids=3D16.
> [    0.497675]  Trampoline variant of Tasks RCU enabled.
> [    0.497676]  Rude variant of Tasks RCU enabled.
> [    0.497676]  Tracing variant of Tasks RCU enabled.
> [    0.497677] rcu: RCU calculated value of scheduler-enlistment delay
> is 100 jiffies.
> [    0.497678] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D16
> [    0.500202] NR_IRQS: 524544, nr_irqs: 1096, preallocated irqs: 16
> [    0.500524] Console: colour dummy device 80x25
> [    0.500749] printk: console [tty0] enabled
> [    0.500759] ACPI: Core revision 20210930
> [    0.500942] clocksource: hpet: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 133484873504 ns
> [    0.500961] APIC: Switch to symmetric I/O mode setup
> [    0.501855] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
> [    0.501858] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
> [    0.501860] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
> [    0.501861] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
> [    0.502172] Switched APIC routing to physical flat.
> [    0.502903] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.506974] Calibrating delay loop (skipped), value calculated
> using timer frequency.. 3393.65 BogoMIPS (lpj=3D1696829)
> [    0.506978] pid_max: default: 32768 minimum: 301
> [    0.512205] LSM: Security Framework initializing
> [    0.512225] Yama: becoming mindful.
> [    0.512232] SELinux:  Initializing.
> [    0.512323] Mount-cache hash table entries: 65536 (order: 7, 524288
> bytes, linear)
> [    0.512398] Mountpoint-cache hash table entries: 65536 (order: 7,
> 524288 bytes, linear)
> [    0.512634] x86/cpu: User Mode Instruction Prevention (UMIP) activated
> [    0.512673] LVT offset 1 assigned for vector 0xf9
> [    0.512739] LVT offset 2 assigned for vector 0xf4
> [    0.512756] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
> [    0.512758] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB=
 0
> [    0.512763] Spectre V1 : Mitigation: usercopy/swapgs barriers and
> __user pointer sanitization
> [    0.512767] Spectre V2 : Mitigation: Retpolines
> [    0.512768] Spectre V2 : Spectre v2 / SpectreRSB mitigation:
> Filling RSB on context switch
> [    0.512770] Spectre V2 : Enabling Restricted Speculation for firmware =
calls
> [    0.512772] Spectre V2 : mitigation: Enabling conditional Indirect
> Branch Prediction Barrier
> [    0.512774] Spectre V2 : User space: Mitigation: STIBP via prctl
> [    0.512776] Speculative Store Bypass: Mitigation: Speculative Store
> Bypass disabled via prctl
> [    0.513756] Freeing SMP alternatives memory: 28K
> [    0.616618] smpboot: CPU0: AMD Ryzen 7 PRO 4750U with Radeon
> Graphics (family: 0x17, model: 0x60, stepping: 0x1)
> [    0.616746] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
> [    0.616752] ... version:                0
> [    0.616754] ... bit width:              48
> [    0.616755] ... generic registers:      6
> [    0.616756] ... value mask:             0000ffffffffffff
> [    0.616758] ... max period:             00007fffffffffff
> [    0.616759] ... fixed-purpose events:   0
> [    0.616760] ... event mask:             000000000000003f
> [    0.616820] rcu: Hierarchical SRCU implementation.
> [    0.616968] NMI watchdog: Enabled. Permanently consumes one hw-PMU cou=
nter.
> [    0.616968] smp: Bringing up secondary CPUs ...
> [    0.616968] x86: Booting SMP configuration:
> [    0.616968] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7
> #8  #9 #10 #11 #12 #13 #14 #15
> [    0.622187] smp: Brought up 1 node, 16 CPUs
> [    0.622187] smpboot: Max logical packages: 1
> [    0.622187] smpboot: Total of 16 processors activated (54298.52 BogoMI=
PS)
> [    2.015179] node 0 deferred pages initialised in 1392ms
> [    2.017297] devtmpfs: initialized
> [    2.017297] x86/mm: Memory block size: 128MB
> [    2.020015] ACPI: PM: Registering ACPI NVS region [mem
> 0x09f00000-0x09f0ffff] (65536 bytes)
> [    2.020015] ACPI: PM: Registering ACPI NVS region [mem
> 0xca97e000-0xcc97dfff] (33554432 bytes)
> [    2.020342] clocksource: jiffies: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 1911260446275000 ns
> [    2.020376] futex hash table entries: 4096 (order: 6, 262144 bytes, li=
near)
> [    2.020457] pinctrl core: initialized pinctrl subsystem
> [    2.020555] PM: RTC time: 05:40:51, date: 2023-08-08
> [    2.020737] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    2.021353] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allo=
cations
> [    2.021666] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for
> atomic allocations
> [    2.021976] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool
> for atomic allocations
> [    2.021995] audit: initializing netlink subsys (disabled)
> [    2.022010] audit: type=3D2000 audit(1691473250.521:1):
> state=3Dinitialized audit_enabled=3D0 res=3D1
> [    2.022115] thermal_sys: Registered thermal governor 'fair_share'
> [    2.022118] thermal_sys: Registered thermal governor 'bang_bang'
> [    2.022123] thermal_sys: Registered thermal governor 'step_wise'
> [    2.022127] thermal_sys: Registered thermal governor 'user_space'
> [    2.022130] thermal_sys: Registered thermal governor 'power_allocator'
> [    2.022143] EISA bus registered
> [    2.022160] cpuidle: using governor ladder
> [    2.022167] cpuidle: using governor menu
> [    2.023025] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    2.023074] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem
> 0xf8000000-0xfbffffff] (base 0xf8000000)
> [    2.023081] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E=
820
> [    2.023094] PCI: Using configuration type 1 for base access
> [    2.024397] kprobes: kprobe jump-optimization is enabled. All
> kprobes are optimized if possible.
> [    2.055775] HugeTLB registered 1.00 GiB page size, pre-allocated 12 pa=
ges
> [    2.055784] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pag=
es
> [    2.056025] cryptd: max_cpu_qlen set to 1000
> [    2.056037] ACPI: Added _OSI(Module Device)
> [    2.056039] ACPI: Added _OSI(Processor Device)
> [    2.056041] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    2.056042] ACPI: Added _OSI(Processor Aggregator Device)
> [    2.056044] ACPI: Added _OSI(Linux-Dell-Video)
> [    2.056046] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> [    2.056047] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> [    2.071972] ACPI: 13 ACPI AML tables successfully acquired and loaded
> [    2.073636] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
> [    2.166993] ACPI: EC: EC started
> [    2.166999] ACPI: EC: interrupt blocked
> [    2.167222] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
> [    2.167227] ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC used to handle
> transactions
> [    2.167233] ACPI: Interpreter enabled
> [    2.167264] ACPI: PM: (supports S0 S3 S4 S5)
> [    2.167267] ACPI: Using IOAPIC for interrupt routing
> [    2.167490] PCI: Using host bridge windows from ACPI; if necessary,
> use "pci=3Dnocrs" and report a bug
> [    2.168163] ACPI: Enabled 3 GPEs in block 00 to 1F
> [    2.169076] ACPI: PM: Power Resource [WRST]
> [    2.169906] ACPI: PM: Power Resource [P0S0]
> [    2.169929] ACPI: PM: Power Resource [P3S0]
> [    2.170000] ACPI: PM: Power Resource [P0S1]
> [    2.170021] ACPI: PM: Power Resource [P3S1]
> [    2.176155] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    2.176162] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM
> ClockPM Segments MSI EDR HPX-Type3]
> [    2.176238] acpi PNP0A08:00: _OSC: platform does not support
> [SHPCHotplug LTR DPC]
> [    2.176372] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME
> AER PCIeCapability]
> [    2.176376] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain
> 0000 [bus 00-3f] only partially covers this bridge
> [    2.176587] PCI host bridge to bus 0000:00
> [    2.176590] pci_bus 0000:00: root bus resource [mem
> 0x000a0000-0x000effff window]
> [    2.176593] pci_bus 0000:00: root bus resource [mem
> 0xd0000000-0xf7ffffff window]
> [    2.176595] pci_bus 0000:00: root bus resource [mem
> 0xfc000000-0xfdffffff window]
> [    2.176597] pci_bus 0000:00: root bus resource [mem
> 0x830000000-0xffffffffff window]
> [    2.176600] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
> [    2.176602] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wind=
ow]
> [    2.176604] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    2.176616] pci 0000:00:00.0: [1022:1630] type 00 class 0x060000
> [    2.176679] pci 0000:00:00.2: [1022:1631] type 00 class 0x080600
> [    2.176744] pci 0000:00:01.0: [1022:1632] type 00 class 0x060000
> [    2.176811] pci 0000:00:02.0: [1022:1632] type 00 class 0x060000
> [    2.176874] pci 0000:00:02.1: [1022:1634] type 01 class 0x060400
> [    2.176930] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
> [    2.177008] pci 0000:00:02.2: [1022:1634] type 01 class 0x060400
> [    2.177064] pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
> [    2.177146] pci 0000:00:02.4: [1022:1634] type 01 class 0x060400
> [    2.177201] pci 0000:00:02.4: PME# supported from D0 D3hot D3cold
> [    2.177278] pci 0000:00:08.0: [1022:1632] type 00 class 0x060000
> [    2.177336] pci 0000:00:08.1: [1022:1635] type 01 class 0x060400
> [    2.177357] pci 0000:00:08.1: enabling Extended Tags
> [    2.177385] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
> [    2.177480] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
> [    2.177573] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
> [    2.177688] pci 0000:00:18.0: [1022:1448] type 00 class 0x060000
> [    2.177731] pci 0000:00:18.1: [1022:1449] type 00 class 0x060000
> [    2.177769] pci 0000:00:18.2: [1022:144a] type 00 class 0x060000
> [    2.177807] pci 0000:00:18.3: [1022:144b] type 00 class 0x060000
> [    2.177845] pci 0000:00:18.4: [1022:144c] type 00 class 0x060000
> [    2.177885] pci 0000:00:18.5: [1022:144d] type 00 class 0x060000
> [    2.177924] pci 0000:00:18.6: [1022:144e] type 00 class 0x060000
> [    2.177962] pci 0000:00:18.7: [1022:144f] type 00 class 0x060000
> [    2.178284] pci 0000:01:00.0: [1987:5012] type 00 class 0x010802
> [    2.178328] pci 0000:01:00.0: reg 0x10: [mem 0xfd600000-0xfd603fff 64b=
it]
> [    2.178799] pci 0000:00:02.1: PCI bridge to [bus 01]
> [    2.178804] pci 0000:00:02.1:   bridge window [mem 0xfd600000-0xfd6fff=
ff]
> [    2.178849] pci 0000:02:00.0: [10ec:8168] type 00 class 0x020000
> [    2.178866] pci 0000:02:00.0: reg 0x10: [io  0x2000-0x20ff]
> [    2.178889] pci 0000:02:00.0: reg 0x18: [mem 0xfd504000-0xfd504fff 64b=
it]
> [    2.178904] pci 0000:02:00.0: reg 0x20: [mem 0xfd500000-0xfd503fff 64b=
it]
> [    2.178994] pci 0000:02:00.0: supports D1 D2
> [    2.178996] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
> [    2.179123] pci 0000:00:02.2: PCI bridge to [bus 02]
> [    2.179126] pci 0000:00:02.2:   bridge window [io  0x2000-0x2fff]
> [    2.179129] pci 0000:00:02.2:   bridge window [mem 0xfd500000-0xfd5fff=
ff]
> [    2.179173] pci 0000:04:00.0: [10ec:522a] type 00 class 0xff0000
> [    2.179188] pci 0000:04:00.0: reg 0x10: [mem 0xfd400000-0xfd400fff]
> [    2.179290] pci 0000:04:00.0: supports D1 D2
> [    2.179292] pci 0000:04:00.0: PME# supported from D1 D2 D3hot D3cold
> [    2.179399] pci 0000:00:02.4: PCI bridge to [bus 04]
> [    2.179404] pci 0000:00:02.4:   bridge window [mem 0xfd400000-0xfd4fff=
ff]
> [    2.179472] pci 0000:06:00.0: [1002:1636] type 00 class 0x030000
> [    2.179483] pci 0000:06:00.0: reg 0x10: [mem
> 0x860000000-0x86fffffff 64bit pref]
> [    2.179491] pci 0000:06:00.0: reg 0x18: [mem
> 0x870000000-0x8701fffff 64bit pref]
> [    2.179498] pci 0000:06:00.0: reg 0x20: [io  0x1000-0x10ff]
> [    2.179504] pci 0000:06:00.0: reg 0x24: [mem 0xfd300000-0xfd37ffff]
> [    2.179512] pci 0000:06:00.0: enabling Extended Tags
> [    2.179524] pci 0000:06:00.0: BAR 0: assigned to efifb
> [    2.179560] pci 0000:06:00.0: PME# supported from D1 D2 D3hot D3cold
> [    2.179593] pci 0000:06:00.0: 126.016 Gb/s available PCIe
> bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:08.1 (capable
> of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
> [    2.179641] pci 0000:06:00.2: [1022:15df] type 00 class 0x108000
> [    2.179654] pci 0000:06:00.2: reg 0x18: [mem 0xfd200000-0xfd2fffff]
> [    2.179664] pci 0000:06:00.2: reg 0x24: [mem 0xfd3c0000-0xfd3c1fff]
> [    2.179672] pci 0000:06:00.2: enabling Extended Tags
> [    2.179746] pci 0000:06:00.3: [1022:1639] type 00 class 0x0c0330
> [    2.179757] pci 0000:06:00.3: reg 0x10: [mem 0xfd000000-0xfd0fffff 64b=
it]
> [    2.179780] pci 0000:06:00.3: enabling Extended Tags
> [    2.179810] pci 0000:06:00.3: PME# supported from D0 D3hot D3cold
> [    2.179861] pci 0000:06:00.4: [1022:1639] type 00 class 0x0c0330
> [    2.179872] pci 0000:06:00.4: reg 0x10: [mem 0xfd100000-0xfd1fffff 64b=
it]
> [    2.179895] pci 0000:06:00.4: enabling Extended Tags
> [    2.179924] pci 0000:06:00.4: PME# supported from D0 D3hot D3cold
> [    2.179982] pci 0000:06:00.5: [1022:15e2] type 00 class 0x048000
> [    2.179990] pci 0000:06:00.5: reg 0x10: [mem 0xfd380000-0xfd3bffff]
> [    2.180010] pci 0000:06:00.5: enabling Extended Tags
> [    2.180038] pci 0000:06:00.5: PME# supported from D0 D3hot D3cold
> [    2.180105] pci 0000:00:08.1: PCI bridge to [bus 06]
> [    2.180108] pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
> [    2.180111] pci 0000:00:08.1:   bridge window [mem 0xfd000000-0xfd3fff=
ff]
> [    2.180114] pci 0000:00:08.1:   bridge window [mem
> 0x860000000-0x8701fffff 64bit pref]
> [    2.180131] pci_bus 0000:00: on NUMA node 0
> [    2.180275] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
> [    2.180334] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
> [    2.180377] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
> [    2.180434] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
> [    2.180486] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
> [    2.180525] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
> [    2.180565] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
> [    2.180604] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
> [    2.182956] ACPI: EC: interrupt unblocked
> [    2.182959] ACPI: EC: event unblocked
> [    2.182966] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
> [    2.182970] ACPI: EC: GPE=3D0x3
> [    2.182972] ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC initialization co=
mplete
> [    2.182974] ACPI: \_SB_.PCI0.LPC0.EC0_: EC: Used to handle
> transactions and events
> [    2.183192] iommu: Default domain type: Translated
> [    2.183192] iommu: DMA domain TLB invalidation policy: lazy mode
> [    2.183192] pci 0000:06:00.0: vgaarb: VGA device added:
> decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
> [    2.183192] pci 0000:06:00.0: vgaarb: bridge control possible
> [    2.183192] pci 0000:06:00.0: vgaarb: setting as boot device
> [    2.183192] vgaarb: loaded
> [    2.183192] SCSI subsystem initialized
> [    2.183192] Registered efivars operations
> [    2.183194] NetLabel: Initializing
> [    2.183194] NetLabel:  domain hash size =3D 128
> [    2.183194] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
> [    2.183194] NetLabel:  unlabeled traffic allowed by default
> [    2.183194] PCI: Using ACPI for IRQ routing
> [    2.185366] PCI: pci_cache_line_size set to 64 bytes
> [    2.185616] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
> [    2.185618] e820: reserve RAM buffer [mem 0x09c00000-0x0bffffff]
> [    2.185619] e820: reserve RAM buffer [mem 0x09f00000-0x0bffffff]
> [    2.185619] e820: reserve RAM buffer [mem 0xc70b8000-0xc7ffffff]
> [    2.185620] e820: reserve RAM buffer [mem 0xce000000-0xcfffffff]
> [    2.185621] e820: reserve RAM buffer [mem 0x80f340000-0x80fffffff]
> [    2.185659] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> [    2.185664] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
> [    2.188014] clocksource: Switched to clocksource hpet
> [    2.196233] VFS: Disk quotas dquot_6.6.0
> [    2.196254] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 by=
tes)
> [    2.196335] pnp: PnP ACPI init
> [    2.196500] system 00:00: [io  0x0f50-0x0f51] has been reserved
> [    2.196505] system 00:00: [mem 0xfec00000-0xfec01fff] could not be res=
erved
> [    2.196507] system 00:00: [mem 0xfee00000-0xfee00fff] has been reserve=
d
> [    2.196509] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserve=
d
> [    2.196741] system 00:02: [io  0x04d0-0x04d1] has been reserved
> [    2.196744] system 00:02: [io  0x0530-0x0537] has been reserved
> [    2.196746] system 00:02: [io  0x0400-0x0427] has been reserved
> [    2.196748] system 00:02: [io  0x0430] has been reserved
> [    2.196750] system 00:02: [io  0x0440-0x0447] has been reserved
> [    2.196752] system 00:02: [io  0x0b00-0x0b1f] has been reserved
> [    2.196753] system 00:02: [io  0x0b20-0x0b3f] has been reserved
> [    2.196755] system 00:02: [io  0x0c00-0x0c01] has been reserved
> [    2.196757] system 00:02: [io  0x0c14] has been reserved
> [    2.196759] system 00:02: [io  0x0c50-0x0c52] has been reserved
> [    2.196762] system 00:02: [io  0x0cd0-0x0cd1] has been reserved
> [    2.196763] system 00:02: [io  0x0cd2-0x0cd3] has been reserved
> [    2.196765] system 00:02: [io  0x0cd4-0x0cd5] has been reserved
> [    2.196767] system 00:02: [io  0x0cd6-0x0cd7] has been reserved
> [    2.196769] system 00:02: [io  0x0cd8-0x0cdf] has been reserved
> [    2.196771] system 00:02: [io  0x0cf9] could not be reserved
> [    2.196773] system 00:02: [io  0x8100-0x81ff window] has been reserved
> [    2.196775] system 00:02: [io  0x8200-0x82ff window] has been reserved
> [    2.196841] system 00:03: [mem 0x000e0000-0x000fffff] could not be res=
erved
> [    2.196844] system 00:03: [mem 0xff000000-0xffffffff] has been reserve=
d
> [    2.196846] system 00:03: [mem 0xfec10000-0xfec1001f] has been reserve=
d
> [    2.196848] system 00:03: [mem 0xfed00000-0xfed003ff] has been reserve=
d
> [    2.196850] system 00:03: [mem 0xfed61000-0xfed613ff] has been reserve=
d
> [    2.196852] system 00:03: [mem 0xfed80000-0xfed80fff] has been reserve=
d
> [    2.200551] pnp: PnP ACPI: found 6 devices
> [    2.208328] clocksource: acpi_pm: mask: 0xffffff max_cycles:
> 0xffffff, max_idle_ns: 2085701024 ns
> [    2.208449] NET: Registered PF_INET protocol family
> [    2.208956] IP idents hash table entries: 262144 (order: 9, 2097152
> bytes, linear)
> [    2.210667] tcp_listen_portaddr_hash hash table entries: 16384
> (order: 6, 262144 bytes, linear)
> [    2.210868] TCP established hash table entries: 262144 (order: 9,
> 2097152 bytes, linear)
> [    2.211262] TCP bind hash table entries: 65536 (order: 8, 1048576
> bytes, linear)
> [    2.211327] TCP: Hash tables configured (established 262144 bind 65536=
)
> [    2.211434] UDP hash table entries: 16384 (order: 7, 524288 bytes, lin=
ear)
> [    2.211535] UDP-Lite hash table entries: 16384 (order: 7, 524288
> bytes, linear)
> [    2.211632] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    2.211639] NET: Registered PF_XDP protocol family
> [    2.211651] pci 0000:00:02.1: PCI bridge to [bus 01]
> [    2.211658] pci 0000:00:02.1:   bridge window [mem 0xfd600000-0xfd6fff=
ff]
> [    2.211664] pci 0000:00:02.2: PCI bridge to [bus 02]
> [    2.211666] pci 0000:00:02.2:   bridge window [io  0x2000-0x2fff]
> [    2.211669] pci 0000:00:02.2:   bridge window [mem 0xfd500000-0xfd5fff=
ff]
> [    2.211674] pci 0000:00:02.4: PCI bridge to [bus 04]
> [    2.211677] pci 0000:00:02.4:   bridge window [mem 0xfd400000-0xfd4fff=
ff]
> [    2.211683] pci 0000:00:08.1: PCI bridge to [bus 06]
> [    2.211685] pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
> [    2.211688] pci 0000:00:08.1:   bridge window [mem 0xfd000000-0xfd3fff=
ff]
> [    2.211691] pci 0000:00:08.1:   bridge window [mem
> 0x860000000-0x8701fffff 64bit pref]
> [    2.211697] pci_bus 0000:00: resource 4 [mem 0x000a0000-0x000effff win=
dow]
> [    2.211699] pci_bus 0000:00: resource 5 [mem 0xd0000000-0xf7ffffff win=
dow]
> [    2.211701] pci_bus 0000:00: resource 6 [mem 0xfc000000-0xfdffffff win=
dow]
> [    2.211703] pci_bus 0000:00: resource 7 [mem 0x830000000-0xffffffffff =
window]
> [    2.211705] pci_bus 0000:00: resource 8 [io  0x0000-0x0cf7 window]
> [    2.211707] pci_bus 0000:00: resource 9 [io  0x0d00-0xffff window]
> [    2.211709] pci_bus 0000:01: resource 1 [mem 0xfd600000-0xfd6fffff]
> [    2.211711] pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
> [    2.211713] pci_bus 0000:02: resource 1 [mem 0xfd500000-0xfd5fffff]
> [    2.211715] pci_bus 0000:04: resource 1 [mem 0xfd400000-0xfd4fffff]
> [    2.211717] pci_bus 0000:06: resource 0 [io  0x1000-0x1fff]
> [    2.211719] pci_bus 0000:06: resource 1 [mem 0xfd000000-0xfd3fffff]
> [    2.211720] pci_bus 0000:06: resource 2 [mem
> 0x860000000-0x8701fffff 64bit pref]
> [    2.212053] pci 0000:06:00.3: extending delay after power-on from
> D3hot to 20 msec
> [    2.212468] pci 0000:06:00.4: extending delay after power-on from
> D3hot to 20 msec
> [    2.212553] PCI: CLS 32 bytes, default 64
> [    2.212567] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters suppo=
rted
> [    2.212652] pci 0000:00:00.2: can't derive routing for PCI INT A
> [    2.212654] pci 0000:00:00.2: PCI INT A: not connected
> [    2.212669] pci 0000:00:01.0: Adding to iommu group 0
> [    2.212679] Trying to unpack rootfs image as initramfs...
> [    2.212681] pci 0000:00:02.0: Adding to iommu group 1
> [    2.212689] pci 0000:00:02.1: Adding to iommu group 2
> [    2.212698] pci 0000:00:02.2: Adding to iommu group 3
> [    2.212704] pci 0000:00:02.4: Adding to iommu group 4
> [    2.212715] pci 0000:00:08.0: Adding to iommu group 5
> [    2.212721] pci 0000:00:08.1: Adding to iommu group 5
> [    2.212732] pci 0000:00:14.0: Adding to iommu group 6
> [    2.212738] pci 0000:00:14.3: Adding to iommu group 6
> [    2.212759] pci 0000:00:18.0: Adding to iommu group 7
> [    2.212765] pci 0000:00:18.1: Adding to iommu group 7
> [    2.212771] pci 0000:00:18.2: Adding to iommu group 7
> [    2.212778] pci 0000:00:18.3: Adding to iommu group 7
> [    2.212784] pci 0000:00:18.4: Adding to iommu group 7
> [    2.212793] pci 0000:00:18.5: Adding to iommu group 7
> [    2.212799] pci 0000:00:18.6: Adding to iommu group 7
> [    2.212806] pci 0000:00:18.7: Adding to iommu group 7
> [    2.212813] pci 0000:01:00.0: Adding to iommu group 8
> [    2.212824] pci 0000:02:00.0: Adding to iommu group 9
> [    2.212831] pci 0000:04:00.0: Adding to iommu group 10
> [    2.212845] pci 0000:06:00.0: Adding to iommu group 5
> [    2.212849] pci 0000:06:00.2: Adding to iommu group 5
> [    2.212853] pci 0000:06:00.3: Adding to iommu group 5
> [    2.212857] pci 0000:06:00.4: Adding to iommu group 5
> [    2.212862] pci 0000:06:00.5: Adding to iommu group 5
> [    2.214384] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
> [    2.214391] AMD-Vi: Extended features (0x206d73ef22254ade): PPR
> X2APIC NX GT IA GA PC GA_vAPIC
> [    2.214397] AMD-Vi: Interrupt remapping enabled
> [    2.214398] AMD-Vi: Virtual APIC enabled
> [    2.214399] AMD-Vi: X2APIC enabled
> [    2.214569] software IO TLB: tearing down default memory pool
> [    2.223165] LVT offset 0 assigned for vector 0x400
> [    2.223831] perf: AMD IBS detected (0x000003ff)
> [    2.223838] amd_uncore: 4  amd_df counters detected
> [    2.223842] amd_uncore: 6  amd_l3 counters detected
> [    2.224699] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters=
/bank).
> [    2.225116] Initialise system trusted keyrings
> [    2.225132] Key type blacklist registered
> [    2.225259] workingset: timestamp_bits=3D46 max_order=3D23 bucket_orde=
r=3D0
> [    2.226034] zbud: loaded
> [    2.226321] integrity: Platform Keyring initialized
> [    2.226323] Key type asymmetric registered
> [    2.226325] Asymmetric key parser 'x509' registered
> [    2.226347] Block layer SCSI generic (bsg) driver version 0.4
> loaded (major 248)
> [    2.226427] io scheduler mq-deadline registered
> [    2.226822] atomic64_test: passed for x86-64 platform with CX8 and wit=
h SSE
> [    2.227299] pcieport 0000:00:02.1: PME: Signaling with IRQ 26
> [    2.227405] pcieport 0000:00:02.2: PME: Signaling with IRQ 27
> [    2.227497] pcieport 0000:00:02.4: PME: Signaling with IRQ 28
> [    2.227590] pcieport 0000:00:08.1: PME: Signaling with IRQ 29
> [    2.227665] shpchp: Standard Hot Plug PCI Controller Driver version: 0=
.4
> [    2.227796] Serial: 8250/16550 driver, 32 ports, IRQ sharing disabled
> [    2.230932] tpm_tis STM0125:00: 2.0 TPM (device-id 0x0, rev-id 78)
> [    2.244486] brd: module loaded
> [    2.244598] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU]
> at 0x60,0x64 irq 1,12
> [    2.247259] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    2.247263] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    2.247287] platform eisa.0: Probing EISA bus 0
> [    2.247290] platform eisa.0: EISA: Cannot allocate resource for mainbo=
ard
> [    2.247292] platform eisa.0: Cannot allocate resource for EISA slot 1
> [    2.247294] platform eisa.0: Cannot allocate resource for EISA slot 2
> [    2.247296] platform eisa.0: Cannot allocate resource for EISA slot 3
> [    2.247298] platform eisa.0: Cannot allocate resource for EISA slot 4
> [    2.247300] platform eisa.0: Cannot allocate resource for EISA slot 5
> [    2.247302] platform eisa.0: Cannot allocate resource for EISA slot 6
> [    2.247304] platform eisa.0: Cannot allocate resource for EISA slot 7
> [    2.247306] platform eisa.0: Cannot allocate resource for EISA slot 8
> [    2.247308] platform eisa.0: EISA: Detected 0 cards
> [    2.248012] ledtrig-cpu: registered to indicate activity on CPUs
> [    2.248046] efifb: probing for efifb
> [    2.248062] efifb: framebuffer at 0x860000000, using 8128k, total 8128=
k
> [    2.248064] efifb: mode is 1920x1080x32, linelength=3D7680, pages=3D1
> [    2.248066] efifb: scrolling: redraw
> [    2.248068] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
> [    2.250224] input: AT Translated Set 2 keyboard as
> /devices/platform/i8042/serio0/input/input0
> [    2.251024] Console: switching to colour frame buffer device 240x67
> [    2.253889] fb0: EFI VGA frame buffer device
> [    2.253928] hid: raw HID events driver (C) Jiri Kosina
> [    2.253995] drop_monitor: Initializing network drop monitor service
> [    2.256066] microcode: CPU0: patch_level=3D0x08600106
> [    2.256085] microcode: CPU1: patch_level=3D0x08600106
> [    2.256102] microcode: CPU2: patch_level=3D0x08600106
> [    2.256156] microcode: CPU3: patch_level=3D0x08600106
> [    2.256169] microcode: CPU4: patch_level=3D0x08600106
> [    2.256189] microcode: CPU5: patch_level=3D0x08600106
> [    2.256203] microcode: CPU6: patch_level=3D0x08600106
> [    2.256223] microcode: CPU7: patch_level=3D0x08600106
> [    2.256264] microcode: CPU8: patch_level=3D0x08600106
> [    2.256304] microcode: CPU9: patch_level=3D0x08600106
> [    2.256350] microcode: CPU10: patch_level=3D0x08600106
> [    2.256388] microcode: CPU11: patch_level=3D0x08600106
> [    2.256428] microcode: CPU12: patch_level=3D0x08600106
> [    2.256448] microcode: CPU13: patch_level=3D0x08600106
> [    2.256478] microcode: CPU14: patch_level=3D0x08600106
> [    2.256517] microcode: CPU15: patch_level=3D0x08600106
> [    2.256596] microcode: Microcode Update Driver: v2.2.
> [    2.257094] resctrl: L3 allocation detected
> [    2.257118] resctrl: MB allocation detected
> [    2.257128] resctrl: L3 monitoring detected
> [    2.257141] IPI shorthand broadcast: enabled
> [    2.257584] registered taskstats version 1
> [    2.258011] Loading compiled-in X.509 certificates
> [    2.277917] Loaded X.509 cert 'Build time autogenerated kernel key:
> fe1b8d35ecbdefd2a5ac888836209366e0d91e43'
> [    2.280212] zswap: loaded using pool lz4/zbud
> [    2.281026] debug_vm_pgtable: [debug_vm_pgtable         ]:
> Validating architecture page table helpers
> [    2.281214] Key type ._fscrypt registered
> [    2.281227] Key type .fscrypt registered
> [    2.281237] Key type fscrypt-provisioning registered
> [    2.282030] Loading compiled-in module X.509 certificates
> [    2.282416] Loaded X.509 cert 'Build time autogenerated kernel key:
> fe1b8d35ecbdefd2a5ac888836209366e0d91e43'
> [    2.282440] ima: Allocated hash algorithm: sha1
> [    2.733269] Freeing initrd memory: 7428K
> [    2.733655] ima: Can not allocate sha256 (reason: -2)
> [    2.750520] ima: No architecture policies found
> [    2.754532] alg: No test for 842 (842-scomp)
> [    2.754636] alg: No test for 842 (842-generic)
> [    2.817294] PM:   Magic number: 3:274:668
> [    2.818043] RAS: Correctable Errors collector initialized.
> [    2.818584] Lockdown: swapper/0: hibernation is restricted; see man
> kernel_lockdown.7
> [    2.819136] Unstable clock detected, switching default tracing
> clock to "global"
>                If you want to keep using the local clock, then add:
>                  "trace_clock=3Dlocal"
>                on the kernel command line
> [    2.822083] Freeing unused decrypted memory: 2036K
> [    2.822924] Freeing unused kernel image (initmem) memory: 2080K
> [    2.832044] Write protecting the kernel read-only data: 20480k
> [    2.834091] Freeing unused kernel image (text/rodata gap) memory: 2040=
K
> [    2.834756] Freeing unused kernel image (rodata/data gap) memory: 760K
> [    2.864058] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [    2.864594] rodata_test: all tests were successful
> [    2.865138] Run /init as init process
> [    2.865678]   with arguments:
> [    2.865680]     /init
> [    2.865680]     dolvm
> [    2.865681]   with environment:
> [    2.865681]     HOME=3D/
> [    2.865682]     TERM=3Dlinux
> [    2.865682]     BOOT_IMAGE=3D/boot/vmlinuz-5.16.17-hardened1-x86_64
> [    2.865683]     real_root=3D/dev/vg0/root
> [    2.865683]     crypt_root=3D/dev/nvme0n1p2
> [    3.368113] nvme 0000:01:00.0: platform quirk: setting simple suspend
> [    3.368175] nvme nvme0: pci function 0000:01:00.0
> [    3.372256] nvme nvme0: missing or invalid SUBNQN field.
> [    3.372302] nvme nvme0: Shutdown timeout set to 10 seconds
> [    3.374853] nvme nvme0: 8/0/0 default/read/poll queues
> [    3.376915]  nvme0n1: p1 p2
> [    3.394574] libata version 3.00 loaded.
> [    3.739141] ACPI: bus type USB registered
> [    3.739164] usbcore: registered new interface driver usbfs
> [    3.739167] usbcore: registered new interface driver hub
> [    3.739178] usbcore: registered new device driver usb
> [    3.740552] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    3.741175] ehci-pci: EHCI PCI platform driver
> [    3.753705] xhci_hcd 0000:06:00.3: xHCI Host Controller
> [    3.753710] xhci_hcd 0000:06:00.3: new USB bus registered, assigned
> bus number 1
> [    3.753801] xhci_hcd 0000:06:00.3: hcc params 0x0268ffe5 hci
> version 0x110 quirks 0x0000020000000410
> [    3.754112] usb usb1: New USB device found, idVendor=3D1d6b,
> idProduct=3D0002, bcdDevice=3D 5.16
> [    3.754114] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    3.754115] usb usb1: Product: xHCI Host Controller
> [    3.754116] usb usb1: Manufacturer: Linux 5.16.17-hardened1-x86_64 xhc=
i-hcd
> [    3.754117] usb usb1: SerialNumber: 0000:06:00.3
> [    3.754225] hub 1-0:1.0: USB hub found
> [    3.754231] hub 1-0:1.0: 4 ports detected
> [    3.754458] xhci_hcd 0000:06:00.3: xHCI Host Controller
> [    3.754460] xhci_hcd 0000:06:00.3: new USB bus registered, assigned
> bus number 2
> [    3.754461] xhci_hcd 0000:06:00.3: Host supports USB 3.1 Enhanced Supe=
rSpeed
> [    3.754471] usb usb2: We don't know the algorithms for LPM for this
> host, disabling LPM.
> [    3.754484] usb usb2: New USB device found, idVendor=3D1d6b,
> idProduct=3D0003, bcdDevice=3D 5.16
> [    3.754486] usb usb2: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    3.754487] usb usb2: Product: xHCI Host Controller
> [    3.754487] usb usb2: Manufacturer: Linux 5.16.17-hardened1-x86_64 xhc=
i-hcd
> [    3.754488] usb usb2: SerialNumber: 0000:06:00.3
> [    3.754574] hub 2-0:1.0: USB hub found
> [    3.754578] hub 2-0:1.0: 2 ports detected
> [    3.754753] xhci_hcd 0000:06:00.4: xHCI Host Controller
> [    3.754755] xhci_hcd 0000:06:00.4: new USB bus registered, assigned
> bus number 3
> [    3.754841] xhci_hcd 0000:06:00.4: hcc params 0x0268ffe5 hci
> version 0x110 quirks 0x0000020000000410
> [    3.755099] usb usb3: New USB device found, idVendor=3D1d6b,
> idProduct=3D0002, bcdDevice=3D 5.16
> [    3.755100] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    3.755101] usb usb3: Product: xHCI Host Controller
> [    3.755102] usb usb3: Manufacturer: Linux 5.16.17-hardened1-x86_64 xhc=
i-hcd
> [    3.755102] usb usb3: SerialNumber: 0000:06:00.4
> [    3.755183] hub 3-0:1.0: USB hub found
> [    3.755188] hub 3-0:1.0: 4 ports detected
> [    3.755398] xhci_hcd 0000:06:00.4: xHCI Host Controller
> [    3.755400] xhci_hcd 0000:06:00.4: new USB bus registered, assigned
> bus number 4
> [    3.755401] xhci_hcd 0000:06:00.4: Host supports USB 3.1 Enhanced Supe=
rSpeed
> [    3.755411] usb usb4: We don't know the algorithms for LPM for this
> host, disabling LPM.
> [    3.755423] usb usb4: New USB device found, idVendor=3D1d6b,
> idProduct=3D0003, bcdDevice=3D 5.16
> [    3.755424] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    3.755425] usb usb4: Product: xHCI Host Controller
> [    3.755426] usb usb4: Manufacturer: Linux 5.16.17-hardened1-x86_64 xhc=
i-hcd
> [    3.755426] usb usb4: SerialNumber: 0000:06:00.4
> [    3.755511] hub 4-0:1.0: USB hub found
> [    3.755514] hub 4-0:1.0: 2 ports detected
> [    3.772503] usbcore: registered new interface driver usb-storage
> [    3.775131] usbcore: registered new interface driver uas
> [    3.778020] uhci_hcd: USB Universal Host Controller Interface driver
> [    3.781096] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    3.784954] usbcore: registered new interface driver usbhid
> [    3.784956] usbhid: USB HID core driver
> [    3.860966] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is
> disabled. Duplicate IMA measurements will not be recorded in the IMA
> log.
> [    3.861002] device-mapper: uevent: version 1.0.3
> [    3.861119] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22)
> initialised: dm-devel@redhat.com
> [    3.888163] Key type trusted registered
> [    3.900493] AVX2 version of gcm_enc/dec engaged.
> [    3.900625] AES CTR mode by8 optimization enabled
> [    3.923924] Key type encrypted registered
> [    3.936262] xor: automatically using best checksumming function   avx
> [    3.936814] async_tx: api initialized (async)
> [    3.944275] device-mapper: dm-log-userspace: version 1.3.0 loaded
> [    3.953870] raid6: skip pq benchmark and using algorithm avx2x4
> [    3.953872] raid6: using avx2x2 recovery algorithm
> [    3.963648] device-mapper: raid: Loading target version 1.15.1
> [    4.156328] Btrfs loaded, crc32c=3Dcrc32c-intel, zoned=3Dyes, fsverity=
=3Dyes
> [    4.171619] FS-Cache: Loaded
> [    4.190215] RPC: Registered named UNIX socket transport module.
> [    4.190218] RPC: Registered udp transport module.
> [    4.190219] RPC: Registered tcp transport module.
> [    4.190219] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    4.216456] FS-Cache: Netfs 'nfs' registered for caching
> [    4.277781] SGI XFS with ACLs, security attributes, scrub, quota,
> no debug enabled
> [    4.304463] fuse: init (API version 7.35)
> [    4.310235] loop: module loaded
> [    4.312999] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    4.354901] NET: Registered PF_ALG protocol family
> [    4.409563] random: lvm: uninitialized urandom read (4 bytes read)
> [    4.445473] random: lvm: uninitialized urandom read (4 bytes read)
> [    4.476467] random: lvm: uninitialized urandom read (4 bytes read)
> [    7.323998] random: crng init done
> [    7.324004] random: 2 urandom warning(s) missed due to ratelimiting
> [   22.987404] EXT4-fs (dm-1): mounted filesystem with ordered data
> mode. Opts: (null). Quota mode: none.
> [   23.056544] SELinux:  policy capability network_peer_controls=3D1
> [   23.056549] SELinux:  policy capability open_perms=3D1
> [   23.056549] SELinux:  policy capability extended_socket_class=3D1
> [   23.056550] SELinux:  policy capability always_check_network=3D0
> [   23.056550] SELinux:  policy capability cgroup_seclabel=3D1
> [   23.056551] SELinux:  policy capability nnp_nosuid_transition=3D1
> [   23.056552] SELinux:  policy capability genfs_seclabel_symlinks=3D0
> [   23.088792] audit: type=3D1403 audit(1691473271.586:2):
> auid=3D4294967295 ses=3D4294967295 lsm=3Dselinux res=3D1
> [   23.103386] audit: type=3D1400 audit(1691473271.600:3): avc:  denied
> { read } for  pid=3D4642 comm=3D"openrc" name=3D"rc.conf" dev=3D"dm-1"
> ino=3D1446822 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dstaff_u:object_r:user_tmp_t tclass=3Dfile permissive=3D1
> [   23.103395] audit: type=3D1400 audit(1691473271.600:4): avc:  denied
> { open } for  pid=3D4642 comm=3D"openrc" path=3D"/etc/rc.conf" dev=3D"dm-=
1"
> ino=3D1446822 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dstaff_u:object_r:user_tmp_t tclass=3Dfile permissive=3D1
> [   23.252549] audit: type=3D1400 audit(1691473271.750:5): avc:  denied
> { mounton } for  pid=3D4659 comm=3D"mount" path=3D"/run" dev=3D"dm-1"
> ino=3D2097153 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:var_run_t tclass=3Ddir permissive=3D1
> [   23.252572] audit: type=3D1400 audit(1691473271.750:6): avc:  denied
> { relabelfrom } for  pid=3D4659 comm=3D"mount"
> scontext=3Dsystem_u:system_r:initrc_t tcontext=3Dsystem_u:object_r:tmpfs_=
t
> tclass=3Dfilesystem permissive=3D1
> [   23.526371] audit: type=3D1400 audit(1691473272.024:7): avc:  denied
> { write } for  pid=3D4780 comm=3D"lvm" path=3D"/dev/null" dev=3D"devtmpfs=
"
> ino=3D3 scontext=3Dsystem_u:system_r:lvm_t
> tcontext=3Dsystem_u:object_r:device_t tclass=3Dchr_file permissive=3D1
> [   23.539360] audit: type=3D1400 audit(1691473272.037:8): avc:  denied
> { read } for  pid=3D4780 comm=3D"lvm" name=3D"urandom" dev=3D"devtmpfs" i=
no=3D7
> scontext=3Dsystem_u:system_r:lvm_t tcontext=3Dsystem_u:object_r:device_t
> tclass=3Dchr_file permissive=3D1
> [   23.539367] audit: type=3D1400 audit(1691473272.037:9): avc:  denied
> { open } for  pid=3D4780 comm=3D"lvm" path=3D"/dev/urandom" dev=3D"devtmp=
fs"
> ino=3D7 scontext=3Dsystem_u:system_r:lvm_t
> tcontext=3Dsystem_u:object_r:device_t tclass=3Dchr_file permissive=3D1
> [   23.906516] audit: type=3D1400 audit(1691473272.404:10): avc:  denied
>  { mounton } for  pid=3D4997 comm=3D"mount" path=3D"/sys/kernel/security"
> dev=3D"sysfs" ino=3D5228 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:sysfs_t tclass=3Ddir permissive=3D1
> [   24.044398] audit: type=3D1400 audit(1691473272.542:11): avc:  denied
>  { mounton } for  pid=3D5057 comm=3D"mount" path=3D"/sys/fs/cgroup/openrc=
"
> dev=3D"tmpfs" ino=3D2 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:initrc_state_t tclass=3Ddir permissive=3D1
> [   24.453650] input: Power Button as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input3
> [   24.454155] ACPI: button: Power Button [PWRB]
> [   24.455185] input: Lid Switch as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input4
> [   24.455289] Monitor-Mwait will be used to enter C-1 state
> [   24.455296] ACPI: \_SB_.PLTF.C000: Found 3 idle states
> [   24.455546] ACPI: \_SB_.PLTF.C001: Found 3 idle states
> [   24.455689] ACPI: \_SB_.PLTF.C002: Found 3 idle states
> [   24.459052] ACPI: \_SB_.PLTF.C003: Found 3 idle states
> [   24.459162] ACPI: button: Lid Switch [LID]
> [   24.460606] ACPI: \_SB_.PLTF.C004: Found 3 idle states
> [   24.460836] input: Sleep Button as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input5
> [   24.461399] rtc_cmos 00:01: RTC can wake from S4
> [   24.461828] ACPI: button: Sleep Button [SLPB]
> [   24.462489] input: Power Button as
> /devices/LNXSYSTM:00/LNXPWRBN:00/input/input6
> [   24.462546] ACPI: \_SB_.PLTF.C005: Found 3 idle states
> [   24.463506] ACPI: button: Power Button [PWRF]
> [   24.463726] rtc_cmos 00:01: registered as rtc0
> [   24.463787] rtc_cmos 00:01: setting system clock to
> 2023-08-08T05:41:13 UTC (1691473273)
> [   24.463791] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes
> nvram, hpet irqs
> [   24.464377] ACPI: \_SB_.PLTF.C006: Found 3 idle states
> [   24.464520] ACPI: \_SB_.PLTF.C007: Found 3 idle states
> [   24.464658] ACPI: \_SB_.PLTF.C008: Found 3 idle states
> [   24.466277] ACPI: \_SB_.PLTF.C009: Found 3 idle states
> [   24.471456] ACPI: \_SB_.PLTF.C00A: Found 3 idle states
> [   24.472832] ACPI: video: Video Device [VGA] (multi-head: yes  rom:
> no  post: no)
> [   24.473584] ACPI: AC: AC Adapter [AC] (on-line)
> [   24.474856] ACPI: \_SB_.PLTF.C00B: Found 3 idle states
> [   24.475776] acpi device:09: registered as cooling_device11
> [   24.475854] ACPI: battery: Slot [BAT0] (battery present)
> [   24.477303] ACPI: \_SB_.PLTF.C00C: Found 3 idle states
> [   24.477621] input: Video Bus as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:08/LNXVIDEO:00/input/i=
nput7
> [   24.480170] ACPI: \_SB_.PLTF.C00D: Found 3 idle states
> [   24.483727] ACPI: \_SB_.PLTF.C00E: Found 3 idle states
> [   24.484878] acpi PNP0C14:01: duplicate WMI GUID
> 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on
> PNP0C14:00)
> [   24.487891] ACPI: \_SB_.PLTF.C00F: Found 3 idle states
> [   24.488075] acpi PNP0C14:02: duplicate WMI GUID
> 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on
> PNP0C14:00)
> [   24.489709] acpi PNP0C14:03: duplicate WMI GUID
> 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on
> PNP0C14:00)
> [   24.491832] piix4_smbus 0000:00:14.0: SMBus Host Controller at
> 0xb00, revision 0
> [   24.491838] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus
> port selection
> [   24.495679] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host
> Controller at 0xb20
> [   24.501814] acpi_cpufreq: overriding BIOS provided _PSD data
> [   24.504246] rtsx_pci 0000:04:00.0: enabling device (0000 -> 0002)
> [   24.507629] ccp 0000:06:00.2: enabling device (0000 -> 0002)
> [   24.507799] snd_rn_pci_acp3x 0000:06:00.5: enabling device (0000 -> 00=
02)
> [   24.511595] ccp 0000:06:00.2: ccp: unable to access the device: you
> might be running a broken BIOS.
> [   24.514178] Non-volatile memory driver v1.3
> [   24.522934] ccp 0000:06:00.2: tee enabled
> [   24.522941] ccp 0000:06:00.2: psp enabled
> [   24.540064] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
> [   24.540158] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO =
address
> [   24.543046] pstore: Using crash dump compression: deflate
> [   24.543273] sp5100-tco sp5100-tco: initialized. heartbeat=3D60 sec (no=
wayout=3D0)
> [   24.553651] ACPI: bus type drm_connector registered
> [   24.558671] thinkpad_acpi: ThinkPad ACPI Extras v0.26
> [   24.558676] thinkpad_acpi: http://ibm-acpi.sf.net/
> [   24.558677] thinkpad_acpi: ThinkPad BIOS R19ET43W (1.27 ), EC R19HT29W
> [   24.558678] thinkpad_acpi: Lenovo ThinkPad L14 Gen 1, model 20U50001MX
> [   24.571495] pstore: Registered efi as persistent store backend
> [   24.572420] thinkpad_acpi: radio switch found; radios are enabled
> [   24.573112] thinkpad_acpi: This ThinkPad has standard ACPI
> backlight brightness control, supported by the ACPI video driver
> [   24.573113] thinkpad_acpi: Disabling thinkpad-acpi brightness
> events by default...
> [   24.599265] r8169 0000:02:00.0 eth0: RTL8168ep/8111ep,
> 8c:8c:aa:c2:92:08, XID 502, IRQ 63
> [   24.599274] r8169 0000:02:00.0 eth0: jumbo features [frames: 9194
> bytes, tx checksumming: ko]
> [   24.726288] AMD-Vi: AMD IOMMUv2 loaded and initialized
> [   24.729124] SVM: TSC scaling supported
> [   24.729130] kvm: Nested Virtualization enabled
> [   24.729132] SVM: kvm: Nested Paging enabled
> [   24.729151] SVM: Virtual VMLOAD VMSAVE supported
> [   24.729152] SVM: Virtual GIF supported
> [   24.729153] SVM: LBR virtualization supported
> [   24.731418] Linux agpgart interface v0.103
> [   24.784442] thinkpad_acpi: battery 1 registered (start 0, stop 100)
> [   24.784507] ACPI: battery: new extension: ThinkPad Battery Extension
> [   24.792954] r8169 0000:02:00.0 enp2s0f0: renamed from eth0
> [   24.805402] input: ThinkPad Extra Buttons as
> /devices/platform/thinkpad_acpi/input/input9
> [   24.890694] [drm] amdgpu kernel modesetting enabled.
> [   24.894745] amdgpu: Virtual CRAT table created for CPU
> [   24.894766] amdgpu: Topology: Add CPU node
> [   24.894868] checking generic (860000000 7f0000) vs hw (860000000 10000=
000)
> [   24.894871] checking generic (860000000 7f0000) vs hw (860000000 10000=
000)
> [   24.894872] fb0: switching to amdgpu from EFI VGA
> [   24.895090] Console: switching to colour dummy device 80x25
> [   24.895147] amdgpu 0000:06:00.0: vgaarb: deactivate vga console
> [   24.895229] amdgpu 0000:06:00.0: enabling device (0006 -> 0007)
> [   24.895332] [drm] initializing kernel modesetting (RENOIR
> 0x1002:0x1636 0x17AA:0x507E 0xD1).
> [   24.895336] amdgpu 0000:06:00.0: amdgpu: Trusted Memory Zone (TMZ)
> feature enabled
> [   24.895805] [drm] register mmio base: 0xFD300000
> [   24.895807] [drm] register mmio size: 524288
> [   24.896994] [drm] add ip block number 0 <soc15_common>
> [   24.896996] [drm] add ip block number 1 <gmc_v9_0>
> [   24.896998] [drm] add ip block number 2 <vega10_ih>
> [   24.896999] [drm] add ip block number 3 <psp>
> [   24.897000] [drm] add ip block number 4 <smu>
> [   24.897002] [drm] add ip block number 5 <dm>
> [   24.897003] [drm] add ip block number 6 <gfx_v9_0>
> [   24.897004] [drm] add ip block number 7 <sdma_v4_0>
> [   24.897006] [drm] add ip block number 8 <vcn_v2_0>
> [   24.897007] [drm] add ip block number 9 <jpeg_v2_0>
> [   24.897039] amdgpu 0000:06:00.0: amdgpu: Fetched VBIOS from VFCT
> [   24.897042] amdgpu: ATOM BIOS: 113-RENOIR-036
> [   24.897055] [drm] VCN decode is enabled in VM mode
> [   24.897056] [drm] VCN encode is enabled in VM mode
> [   24.897057] [drm] JPEG decode is enabled in VM mode
> [   24.897058] amdgpu 0000:06:00.0: amdgpu: PCIE atomic ops is not suppor=
ted
> [   24.897109] [drm] vm size is 262144 GB, 4 levels, block size is
> 9-bit, fragment size is 9-bit
> [   24.897116] amdgpu 0000:06:00.0: amdgpu: VRAM: 512M
> 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
> [   24.897117] amdgpu 0000:06:00.0: amdgpu: GART: 1024M
> 0x0000000000000000 - 0x000000003FFFFFFF
> [   24.897119] amdgpu 0000:06:00.0: amdgpu: AGP: 267419648M
> 0x000000F800000000 - 0x0000FFFFFFFFFFFF
> [   24.897123] [drm] Detected VRAM RAM=3D512M, BAR=3D512M
> [   24.897124] [drm] RAM width 128bits DDR4
> [   24.897185] [drm] amdgpu: 512M of VRAM memory ready
> [   24.897186] [drm] amdgpu: 3072M of GTT memory ready.
> [   24.897193] [drm] GART: num cpu pages 262144, num gpu pages 262144
> [   24.897315] [drm] PCIE GART of 1024M enabled.
> [   24.897316] [drm] PTB located at 0x000000F400900000
> [   24.897489] amdgpu 0000:06:00.0: amdgpu: PSP runtime database doesn't =
exist
> [   24.897497] [drm] Loading DMUB firmware via PSP: version=3D0x0101001F
> [   24.898603] [drm] Found VCN firmware Version ENC: 1.16 DEC: 5 VEP:
> 0 Revision: 3
> [   24.898613] amdgpu 0000:06:00.0: amdgpu: Will use PSP to load VCN firm=
ware
> [   25.438943] psmouse serio1: synaptics: queried max coordinates: x
> [..5678], y [..4694]
> [   25.474850] psmouse serio1: synaptics: queried min coordinates: x
> [1266..], y [1162..]
> [   25.474861] psmouse serio1: synaptics: The touchpad can support a
> better bus than the too old PS/2 protocol. Make sure
> MOUSE_PS2_SYNAPTICS_SMBUS and RMI4_SMB are enabled to get a better
> touchpad experience.
> [   25.544697] psmouse serio1: synaptics: Touchpad model: 1, fw:
> 10.32, id: 0x1e2a1, caps: 0xf014a3/0x940300/0x12e800/0x500000, board
> id: 3471, fw id: 2909640
> [   25.544715] psmouse serio1: synaptics: serio: Synaptics
> pass-through port at isa0060/serio1/input0
> [   25.593603] input: SynPS/2 Synaptics TouchPad as
> /devices/platform/i8042/serio1/input/input8
> [   25.601988] mousedev: PS/2 mouse device common for all mice
> [   25.704604] [drm] reserve 0x400000 from 0xf41f800000 for PSP TMR
> [   25.788602] amdgpu 0000:06:00.0: amdgpu: RAS: optional ras ta ucode
> is not available
> [   25.799896] amdgpu 0000:06:00.0: amdgpu: RAP: optional rap ta ucode
> is not available
> [   25.799903] amdgpu 0000:06:00.0: amdgpu: SECUREDISPLAY:
> securedisplay ta ucode is not available
> [   25.800597] amdgpu 0000:06:00.0: amdgpu: SMU is initialized successful=
ly!
> [   25.801697] [drm] Display Core initialized with v3.2.160!
> [   25.802350] [drm] DMUB hardware initialized: version=3D0x0101001F
> [   25.814923] EXT4-fs (dm-1): re-mounted. Opts: (null). Quota mode: none=
.
> [   25.831906] EXT4-fs (dm-1): re-mounted. Opts: (null). Quota mode: none=
.
> [   25.913238] [drm] DP Alt mode state on HPD: 0
> [   26.006648] EXT4-fs (dm-2): mounted filesystem with ordered data
> mode. Opts: (null). Quota mode: none.
> [   26.102703] psmouse serio2: trackpoint: Elan TrackPoint firmware:
> 0x11, buttons: 3/3
> [   26.115410] [drm] Alt mode has timed out after 202 ms
> [   26.115531] [drm] DP Alt mode state on HPD: 0
> [   26.317447] [drm] Alt mode has timed out after 201 ms
> [   26.319401] [drm] kiq ring mec 2 pipe 1 q 0
> [   26.322526] [drm] VCN decode and encode initialized
> successfully(under DPG Mode).
> [   26.322545] [drm] JPEG decode initialized successfully.
> [   26.323936] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
> [   26.325439] input: TPPS/2 Elan TrackPoint as
> /devices/platform/i8042/serio1/serio2/input/input10
> [   26.350446] memmap_init_zone_device initialised 131072 pages in 1ms
> [   26.350459] amdgpu: HMM registered 512MB device memory
> [   26.350506] amdgpu: Virtual CRAT table created for GPU
> [   26.350614] amdgpu: Topology: Add dGPU node [0x1636:0x1002]
> [   26.350620] kfd kfd: amdgpu: added device 1002:1636
> [   26.350675] amdgpu 0000:06:00.0: amdgpu: SE 1, SH per SE 1, CU per
> SH 8, active_cu_number 7
> [   26.353115] [drm] fb mappable at 0x810CD2000
> [   26.353116] [drm] vram apper at 0x810000000
> [   26.353117] [drm] size 8294400
> [   26.353117] [drm] fb depth is 24
> [   26.353118] [drm]    pitch is 7680
> [   26.353222] fbcon: amdgpudrmfb (fb0) is primary device
> [   26.376885] elogind-daemon[7111]: Watching system buttons on
> /dev/input/event4 (Power Button)
> [   26.377037] elogind-daemon[7111]: Watching system buttons on
> /dev/input/event1 (Power Button)
> [   26.378071] elogind-daemon[7111]: Watching system buttons on
> /dev/input/event2 (Lid Switch)
> [   26.378202] elogind-daemon[7111]: Watching system buttons on
> /dev/input/event3 (Sleep Button)
> [   26.378311] elogind-daemon[7111]: Watching system buttons on
> /dev/input/event0 (AT Translated Set 2 keyboard)
> [   26.378489] elogind-daemon[7111]: Watching system buttons on
> /dev/input/event6 (ThinkPad Extra Buttons)
> [   26.378576] elogind-daemon[7111]: New seat seat0.
> [   26.410728] Console: switching to colour frame buffer device 240x67
> [   26.433782] amdgpu 0000:06:00.0: [drm] fb0: amdgpudrmfb frame buffer d=
evice
> [   26.452693] amdgpu 0000:06:00.0: amdgpu: ring gfx uses VM inv eng 0 on=
 hub 0
> [   26.452702] amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.0 uses VM
> inv eng 1 on hub 0
> [   26.452705] amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.0 uses VM
> inv eng 4 on hub 0
> [   26.452708] amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.0 uses VM
> inv eng 5 on hub 0
> [   26.452710] amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.0 uses VM
> inv eng 6 on hub 0
> [   26.452712] amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.1 uses VM
> inv eng 7 on hub 0
> [   26.452714] amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.1 uses VM
> inv eng 8 on hub 0
> [   26.452716] amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.1 uses VM
> inv eng 9 on hub 0
> [   26.452719] amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.1 uses VM
> inv eng 10 on hub 0
> [   26.452721] amdgpu 0000:06:00.0: amdgpu: ring kiq_2.1.0 uses VM inv
> eng 11 on hub 0
> [   26.452724] amdgpu 0000:06:00.0: amdgpu: ring sdma0 uses VM inv eng
> 0 on hub 1
> [   26.452727] amdgpu 0000:06:00.0: amdgpu: ring vcn_dec uses VM inv
> eng 1 on hub 1
> [   26.452729] amdgpu 0000:06:00.0: amdgpu: ring vcn_enc0 uses VM inv
> eng 4 on hub 1
> [   26.452732] amdgpu 0000:06:00.0: amdgpu: ring vcn_enc1 uses VM inv
> eng 5 on hub 1
> [   26.452734] amdgpu 0000:06:00.0: amdgpu: ring jpeg_dec uses VM inv
> eng 6 on hub 1
> [   26.455591] [drm] Initialized amdgpu 3.44.0 20150101 for
> 0000:06:00.0 on minor 0
> [   27.877021] NET: Registered PF_INET6 protocol family
> [   27.881573] Segment Routing with IPv6
> [   27.881592] In-situ OAM (IOAM) with IPv6
> [   27.904519] 8021q: 802.1Q VLAN Support v1.8
> [   27.983342] cfg80211: Loading compiled-in X.509 certificates for
> regulatory database
> [   28.005634] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [   28.069058] Generic FE-GE Realtek PHY r8169-0-200:00: attached PHY
> driver (mii_bus:phy_addr=3Dr8169-0-200:00, irq=3DMAC)
> [   28.175598] r8169 0000:02:00.0 enp2s0f0: Link is Down
> [   28.191496] kauditd_printk_skb: 118 callbacks suppressed
> [   28.191502] audit: type=3D1400 audit(1691473277.632:130): avc:
> denied  { getattr } for  pid=3D8802 comm=3D"rm" name=3D"/" dev=3D"tmpfs" =
ino=3D1
> scontext=3Dsystem_u:system_r:resolvconf_t
> tcontext=3Dsystem_u:object_r:tmpfs_t tclass=3Dfilesystem permissive=3D1
> [   28.314427] audit: type=3D1400 audit(1691473277.755:131): avc:
> denied  { ioctl } for  pid=3D8796 comm=3D"fail2ban-server"
> path=3D"/etc/fail2ban/jail.conf" dev=3D"dm-1" ino=3D1448763 ioctlcmd=3D0x=
5401
> scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dstaff_u:object_r:user_tmp_t tclass=3Dfile permissive=3D1
> [   28.349938] audit: type=3D1400 audit(1691473277.790:132): avc:
> denied  { getattr } for  pid=3D8809 comm=3D"start-stop-daem"
> path=3D"pid:[4026531836]" dev=3D"nsfs" ino=3D4026531836
> scontext=3Dsystem_u:system_r:initrc_t tcontext=3Dsystem_u:object_r:nsfs_t
> tclass=3Dfile permissive=3D1
> [   28.606125] audit: type=3D1400 audit(1691473278.047:133): avc:
> denied  { create } for  pid=3D8813 comm=3D"fail2ban-server"
> name=3D"fail2ban.sock" scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:fail2ban_runtime_t tclass=3Dsock_file
> permissive=3D1
> [   28.609851] audit: type=3D1400 audit(1691473278.050:134): avc:
> denied  { read write } for  pid=3D8813 comm=3D"fail2ban-server"
> name=3D"fail2ban.sqlite3" dev=3D"dm-1" ino=3D1187668
> scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dstaff_u:object_r:fail2ban_var_lib_t tclass=3Dfile permissive=
=3D1
> [   28.609861] audit: type=3D1400 audit(1691473278.050:135): avc:
> denied  { open } for  pid=3D8813 comm=3D"fail2ban-server"
> path=3D"/var/lib/fail2ban/fail2ban.sqlite3" dev=3D"dm-1" ino=3D1187668
> scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dstaff_u:object_r:fail2ban_var_lib_t tclass=3Dfile permissive=
=3D1
> [   28.828756] audit: type=3D1400 audit(1691473278.269:136): avc:
> denied  { read } for  pid=3D8843 comm=3D"fwupd" name=3D"metainfo.xmlb"
> dev=3D"dm-1" ino=3D136332 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:var_t tclass=3Dfile permissive=3D1
> [   28.828765] audit: type=3D1400 audit(1691473278.269:137): avc:
> denied  { open } for  pid=3D8843 comm=3D"fwupd"
> path=3D"/var/cache/fwupd/metainfo.xmlb" dev=3D"dm-1" ino=3D136332
> scontext=3Dsystem_u:system_r:initrc_t tcontext=3Dsystem_u:object_r:var_t
> tclass=3Dfile permissive=3D1
> [   28.832414] audit: type=3D1400 audit(1691473278.273:138): avc:
> denied  { write } for  pid=3D8843 comm=3D"fwupd" name=3D"metainfo.xmlb"
> dev=3D"dm-1" ino=3D136332 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:var_t tclass=3Dfile permissive=3D1
> [   28.832439] audit: type=3D1400 audit(1691473278.273:139): avc:
> denied  { create } for  pid=3D8843 comm=3D"fwupd"
> name=3D".goutputstream-YB5H91" scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:var_t tclass=3Dfile permissive=3D1
> [   44.711856] elogind-daemon[7111]: New session 3 of user pekkari.
> [   51.870726] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   51.875852] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   51.876632] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   51.877234] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   51.877248] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   52.059877] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   52.065084] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   52.065436] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   85.298684] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   85.304496] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   85.304785] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
>
>     And the dmesg output of the recent kernel:
>
> [    0.000000] Linux version 6.4.7-hardened1-x86_64+ (root@woodpecker)
> (x86_64-pc-linux-gnu-gcc (Gentoo Hardened 12.2.1_p20230428-r1 p2)
> 12.2.1 20230428, GNU ld (Gentoo 2.39 p6) 2.39.0) #4 SMP
> PREEMPT_DYNAMIC Wed Aug  2 15:33:23 EE
> ST 2023
> [    0.000000] Kernel is locked down from Kernel configuration; see
> man kernel_lockdown.7
> [    0.000000] Command line:
> BOOT_IMAGE=3D/boot/vmlinuz-6.4.7-hardened1-x86_64+
> root=3D/dev/mapper/vg0-root ro real_root=3D/dev/vg0/root dolvm
> crypt_root=3D/dev/nvme0n1p2 tsc=3Dunstable ima_policy=3Dappraise_tcb
> ima_appraise=3Denforce enforcing=3D
> 0 default_hugepagesz=3D1G hugepagesz=3D1G hugepages=3D12 crashkernel=3D25=
6M
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   AMD AuthenticAMD
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating
> point registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is
> 832 bytes, using 'compacted' format.
> [    0.000000] signal: max sigframe size: 1776
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009bfffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000009c00000-0x0000000009d20fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000009d21000-0x0000000009efffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000009f00000-0x0000000009f0ffff] ACP=
I NVS
> [    0.000000] BIOS-e820: [mem 0x0000000009f10000-0x00000000c70b7fff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x00000000c70b8000-0x00000000c72b7fff] typ=
e 20
> [    0.000000] BIOS-e820: [mem 0x00000000c72b8000-0x00000000ca97dfff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000ca97e000-0x00000000cc97dfff] ACP=
I NVS
> [    0.000000] BIOS-e820: [mem 0x00000000cc97e000-0x00000000cc9fdfff] ACP=
I data
> [    0.000000] BIOS-e820: [mem 0x00000000cc9fe000-0x00000000cdffffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x00000000ce000000-0x00000000cfffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fdd00000-0x00000000fddfffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed80fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000080f33ffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000080f340000-0x000000082fffffff] res=
erved
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] efi: EFI v2.7 by Lenovo
> [    0.000000] efi: ACPI=3D0xcc9fd000 ACPI 2.0=3D0xcc9fd014
> SMBIOS=3D0xc8895000 SMBIOS 3.0=3D0xc8888000 TPMFinalLog=3D0xcc82d000
> MEMATTR=3D0xc40e6018 ESRT=3D0xc75b5000
> [    0.000000] efi: Remove mem46: MMIO range=3D[0xfdd00000-0xfddfffff]
> (1MB) from e820 map
> [    0.000000] e820: remove [mem 0xfdd00000-0xfddfffff] reserved
> [    0.000000] efi: Not removing mem47: MMIO
> range=3D[0xfed80000-0xfed80fff] (4KB) from e820 map
> [    0.000000] SMBIOS 3.2.0 present.
> [    0.000000] DMI: LENOVO 20U50001MX/20U50001MX, BIOS R19ET43W (1.27
> ) 06/27/2022
> [    0.000000] tsc: Fast TSC calibration using PIT
> [    0.000000] tsc: Detected 1696.795 MHz processor
> [    0.000011] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000013] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000020] last_pfn =3D 0x80f340 max_arch_pfn =3D 0x400000000
> [    0.000025] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- =
WT
> [    0.000230] last_pfn =3D 0xce000 max_arch_pfn =3D 0x400000000
> [    0.003784] esrt: Reserving ESRT space from 0x00000000c75b5000 to
> 0x00000000c75b50b0.
> [    0.003793] Using GB pages for direct mapping
> [    0.004140] Secure boot disabled
> [    0.004141] RAMDISK: [mem 0x3708f000-0x3783efff]
> [    0.004144] ACPI: Early table checksum verification disabled
> [    0.004147] ACPI: RSDP 0x00000000CC9FD014 000024 (v02 LENOVO)
> [    0.004151] ACPI: XSDT 0x00000000CC9FB188 0000FC (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004155] ACPI: FACP 0x00000000C75E4000 000114 (v06 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004159] ACPI: DSDT 0x00000000C75CF000 00EC08 (v01 LENOVO TP-R19
>   00001270 INTL 20180313)
> [    0.004162] ACPI: FACS 0x00000000CBF7A000 000040
> [    0.004163] ACPI: SSDT 0x00000000C889C000 00077C (v02 LENOVO
> UsbCTabl 00001000 INTL 20180313)
> [    0.004165] ACPI: SSDT 0x00000000C8874000 00723C (v02 LENOVO TP-R19
>   00000002 MSFT 04000000)
> [    0.004168] ACPI: IVRS 0x00000000C8873000 0001A4 (v02 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004170] ACPI: SSDT 0x00000000C884E000 000266 (v01 LENOVO STD3
>   00000001 INTL 20180313)
> [    0.004172] ACPI: SSDT 0x00000000C883A000 00064C (v02 LENOVO
> Tpm2Tabl 00001000 INTL 20180313)
> [    0.004174] ACPI: TPM2 0x00000000C8839000 000034 (v03 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004176] ACPI: MSDM 0x00000000C8801000 000055 (v03 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004178] ACPI: BATB 0x00000000C87EB000 00004A (v02 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004180] ACPI: HPET 0x00000000C75E3000 000038 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004182] ACPI: APIC 0x00000000C75E2000 000138 (v02 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004184] ACPI: MCFG 0x00000000C75E1000 00003C (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004186] ACPI: SBST 0x00000000C75E0000 000030 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004188] ACPI: WSMT 0x00000000C75DF000 000028 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004190] ACPI: SSDT 0x00000000C75DE000 000083 (v02 LENOVO
> PID0Ssdt 00000010 INTL 20180313)
> [    0.004192] ACPI: VFCT 0x00000000C75C1000 00D684 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004194] ACPI: SSDT 0x00000000C75BD000 0039F4 (v01 LENOVO TP-R19
>   00000001 AMD  00000001)
> [    0.004196] ACPI: CRAT 0x00000000C75BC000 000F00 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004198] ACPI: CDIT 0x00000000C75BB000 000029 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004200] ACPI: FPDT 0x00000000C8813000 000034 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004203] ACPI: SSDT 0x00000000C75BA000 000149 (v01 LENOVO TP-R19
>   00000001 INTL 20180313)
> [    0.004205] ACPI: SSDT 0x00000000C75B8000 001497 (v01 LENOVO TP-R19
>   00000001 INTL 20180313)
> [    0.004207] ACPI: SSDT 0x00000000C75B6000 001576 (v01 LENOVO TP-R19
>   00000001 INTL 20180313)
> [    0.004209] ACPI: SSDT 0x00000000C75B1000 00353C (v01 LENOVO TP-R19
>   00000001 INTL 20180313)
> [    0.004211] ACPI: UEFI 0x00000000CBF79000 000116 (v01 LENOVO TP-R19
>   00001270 PTEC 00000002)
> [    0.004213] ACPI: SSDT 0x00000000C889A000 000090 (v01 LENOVO TP-R19
>   00000001 INTL 20180313)
> [    0.004215] ACPI: SSDT 0x00000000C8899000 0009AD (v01 LENOVO TP-R19
>   00000001 INTL 20180313)
> [    0.004216] ACPI: Reserving FACP table memory at [mem 0xc75e4000-0xc75=
e4113]
> [    0.004218] ACPI: Reserving DSDT table memory at [mem 0xc75cf000-0xc75=
ddc07]
> [    0.004218] ACPI: Reserving FACS table memory at [mem 0xcbf7a000-0xcbf=
7a03f]
> [    0.004219] ACPI: Reserving SSDT table memory at [mem 0xc889c000-0xc88=
9c77b]
> [    0.004219] ACPI: Reserving SSDT table memory at [mem 0xc8874000-0xc88=
7b23b]
> [    0.004220] ACPI: Reserving IVRS table memory at [mem 0xc8873000-0xc88=
731a3]
> [    0.004221] ACPI: Reserving SSDT table memory at [mem 0xc884e000-0xc88=
4e265]
> [    0.004221] ACPI: Reserving SSDT table memory at [mem 0xc883a000-0xc88=
3a64b]
> [    0.004222] ACPI: Reserving TPM2 table memory at [mem 0xc8839000-0xc88=
39033]
> [    0.004222] ACPI: Reserving MSDM table memory at [mem 0xc8801000-0xc88=
01054]
> [    0.004223] ACPI: Reserving BATB table memory at [mem 0xc87eb000-0xc87=
eb049]
> [    0.004223] ACPI: Reserving HPET table memory at [mem 0xc75e3000-0xc75=
e3037]
> [    0.004224] ACPI: Reserving APIC table memory at [mem 0xc75e2000-0xc75=
e2137]
> [    0.004225] ACPI: Reserving MCFG table memory at [mem 0xc75e1000-0xc75=
e103b]
> [    0.004225] ACPI: Reserving SBST table memory at [mem 0xc75e0000-0xc75=
e002f]
> [    0.004226] ACPI: Reserving WSMT table memory at [mem 0xc75df000-0xc75=
df027]
> [    0.004226] ACPI: Reserving SSDT table memory at [mem 0xc75de000-0xc75=
de082]
> [    0.004227] ACPI: Reserving VFCT table memory at [mem 0xc75c1000-0xc75=
ce683]
> [    0.004228] ACPI: Reserving SSDT table memory at [mem 0xc75bd000-0xc75=
c09f3]
> [    0.004228] ACPI: Reserving CRAT table memory at [mem 0xc75bc000-0xc75=
bceff]
> [    0.004229] ACPI: Reserving CDIT table memory at [mem 0xc75bb000-0xc75=
bb028]
> [    0.004229] ACPI: Reserving FPDT table memory at [mem 0xc8813000-0xc88=
13033]
> [    0.004230] ACPI: Reserving SSDT table memory at [mem 0xc75ba000-0xc75=
ba148]
> [    0.004231] ACPI: Reserving SSDT table memory at [mem 0xc75b8000-0xc75=
b9496]
> [    0.004231] ACPI: Reserving SSDT table memory at [mem 0xc75b6000-0xc75=
b7575]
> [    0.004232] ACPI: Reserving SSDT table memory at [mem 0xc75b1000-0xc75=
b453b]
> [    0.004232] ACPI: Reserving UEFI table memory at [mem 0xcbf79000-0xcbf=
79115]
> [    0.004233] ACPI: Reserving SSDT table memory at [mem 0xc889a000-0xc88=
9a08f]
> [    0.004234] ACPI: Reserving SSDT table memory at [mem 0xc8899000-0xc88=
999ac]
> [    0.004252] Reserving 256MB of memory at 2880MB for crashkernel
> (System RAM: 32120MB)
> [    0.063088] Zone ranges:
> [    0.063091]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.063093]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [    0.063094]   Normal   [mem 0x0000000100000000-0x000000080f33ffff]
> [    0.063095]   Device   empty
> [    0.063096] Movable zone start for each node
> [    0.063096] Early memory node ranges
> [    0.063097]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> [    0.063098]   node   0: [mem 0x0000000000100000-0x0000000009bfffff]
> [    0.063099]   node   0: [mem 0x0000000009d21000-0x0000000009efffff]
> [    0.063100]   node   0: [mem 0x0000000009f10000-0x00000000c70b7fff]
> [    0.063101]   node   0: [mem 0x00000000cc9fe000-0x00000000cdffffff]
> [    0.063102]   node   0: [mem 0x0000000100000000-0x000000080f33ffff]
> [    0.063104] Initmem setup node 0 [mem 0x0000000000001000-0x000000080f3=
3ffff]
> [    0.063111] On node 0, zone DMA: 1 pages in unavailable ranges
> [    0.063145] On node 0, zone DMA: 97 pages in unavailable ranges
> [    0.063460] On node 0, zone DMA32: 289 pages in unavailable ranges
> [    0.069881] On node 0, zone DMA32: 16 pages in unavailable ranges
> [    0.070136] On node 0, zone DMA32: 22854 pages in unavailable ranges
> [    0.070507] On node 0, zone Normal: 8192 pages in unavailable ranges
> [    0.070536] On node 0, zone Normal: 3264 pages in unavailable ranges
> [    0.070978] ACPI: PM-Timer IO Port: 0x408
> [    0.070986] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
> [    0.070988] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
> [    0.070988] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
> [    0.070989] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
> [    0.070989] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
> [    0.070990] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
> [    0.070991] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
> [    0.070991] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
> [    0.070992] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
> [    0.070992] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
> [    0.070993] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
> [    0.070993] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
> [    0.070994] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
> [    0.070994] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
> [    0.070995] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
> [    0.070995] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
> [    0.071009] IOAPIC[0]: apic_id 32, version 33, address 0xfec00000, GSI=
 0-23
> [    0.071014] IOAPIC[1]: apic_id 33, version 33, address 0xfec01000, GSI=
 24-55
> [    0.071015] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.071017] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
> [    0.071021] ACPI: Using ACPI (MADT) for SMP configuration information
> [    0.071022] ACPI: HPET id: 0x43538210 base: 0xfed00000
> [    0.071027] smpboot: Allowing 16 CPUs, 0 hotplug CPUs
> [    0.071043] PM: hibernation: Registered nosave memory: [mem
> 0x00000000-0x00000fff]
> [    0.071045] PM: hibernation: Registered nosave memory: [mem
> 0x0009f000-0x0009ffff]
> [    0.071046] PM: hibernation: Registered nosave memory: [mem
> 0x000a0000-0x000dffff]
> [    0.071047] PM: hibernation: Registered nosave memory: [mem
> 0x000e0000-0x000fffff]
> [    0.071048] PM: hibernation: Registered nosave memory: [mem
> 0x09c00000-0x09d20fff]
> [    0.071050] PM: hibernation: Registered nosave memory: [mem
> 0x09f00000-0x09f0ffff]
> [    0.071051] PM: hibernation: Registered nosave memory: [mem
> 0xc70b8000-0xc72b7fff]
> [    0.071052] PM: hibernation: Registered nosave memory: [mem
> 0xc72b8000-0xca97dfff]
> [    0.071052] PM: hibernation: Registered nosave memory: [mem
> 0xca97e000-0xcc97dfff]
> [    0.071053] PM: hibernation: Registered nosave memory: [mem
> 0xcc97e000-0xcc9fdfff]
> [    0.071054] PM: hibernation: Registered nosave memory: [mem
> 0xce000000-0xcfffffff]
> [    0.071055] PM: hibernation: Registered nosave memory: [mem
> 0xd0000000-0xf7ffffff]
> [    0.071055] PM: hibernation: Registered nosave memory: [mem
> 0xf8000000-0xfbffffff]
> [    0.071056] PM: hibernation: Registered nosave memory: [mem
> 0xfc000000-0xfed7ffff]
> [    0.071056] PM: hibernation: Registered nosave memory: [mem
> 0xfed80000-0xfed80fff]
> [    0.071057] PM: hibernation: Registered nosave memory: [mem
> 0xfed81000-0xffffffff]
> [    0.071058] [mem 0xd0000000-0xf7ffffff] available for PCI devices
> [    0.071060] Booting paravirtualized kernel on bare hardware
> [    0.071062] clocksource: refined-jiffies: mask: 0xffffffff
> max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
> [    0.074158] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:16
> nr_cpu_ids:16 nr_node_ids:1
> [    0.074710] percpu: Embedded 56 pages/cpu s192512 r8192 d28672 u262144
> [    0.074718] pcpu-alloc: s192512 r8192 d28672 u262144 alloc=3D1*2097152
> [    0.074720] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11
> 12 13 14 15
> [    0.074749] Kernel command line:
> BOOT_IMAGE=3D/boot/vmlinuz-6.4.7-hardened1-x86_64+
> root=3D/dev/mapper/vg0-root ro real_root=3D/dev/vg0/root dolvm
> crypt_root=3D/dev/nvme0n1p2 tsc=3Dunstable ima_policy=3Dappraise_tcb
> ima_appraise=3Denforce enf
> orcing=3D0 default_hugepagesz=3D1G hugepagesz=3D1G hugepages=3D12 crashke=
rnel=3D256M
> [    0.074804] tsc: Marking TSC unstable due to boot parameter
> [    0.074873] Unknown kernel command line parameters "dolvm
> BOOT_IMAGE=3D/boot/vmlinuz-6.4.7-hardened1-x86_64+
> real_root=3D/dev/vg0/root crypt_root=3D/dev/nvme0n1p2", will be passed to
> user space.
> [    0.074904] random: crng init done
> [    0.074905] printk: log_buf_len individual max cpu contribution: 32768=
 bytes
> [    0.074906] printk: log_buf_len total cpu_extra contributions: 491520 =
bytes
> [    0.074906] printk: log_buf_len min size: 262144 bytes
> [    0.075540] printk: log_buf_len: 1048576 bytes
> [    0.075541] printk: early log buf free: 247968(94%)
> [    0.079273] Dentry cache hash table entries: 4194304 (order: 13,
> 33554432 bytes, linear)
> [    0.081138] Inode-cache hash table entries: 2097152 (order: 12,
> 16777216 bytes, linear)
> [    0.081250] Built 1 zonelists, mobility grouping on.  Total pages: 809=
4181
> [    0.081253] mem auto-init: stack:all(zero), heap alloc:on, heap free:o=
n
> [    0.081253] mem auto-init: clearing system memory may take some time..=
.
> [    0.081296] software IO TLB: area num 16.
> [    0.492413] Memory: 3044312K/32891292K available (12288K kernel
> code, 2499K rwdata, 5752K rodata, 2460K init, 5460K bss, 13558704K
> reserved, 0K cma-reserved)
> [    0.492543] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D16=
, Nodes=3D1
> [    0.492573] ftrace: allocating 36809 entries in 144 pages
> [    0.497996] ftrace: allocated 144 pages with 2 groups
> [    0.498548] Dynamic Preempt: voluntary
> [    0.498585] rcu: Preemptible hierarchical RCU implementation.
> [    0.498585] rcu:     RCU restricting CPUs from NR_CPUS=3D8192 to nr_cp=
u_ids=3D16.
> [    0.498586]  Trampoline variant of Tasks RCU enabled.
> [    0.498587]  Rude variant of Tasks RCU enabled.
> [    0.498587]  Tracing variant of Tasks RCU enabled.
> [    0.498588] rcu: RCU calculated value of scheduler-enlistment delay
> is 100 jiffies.
> [    0.498588] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D16
> [    0.500772] NR_IRQS: 524544, nr_irqs: 1096, preallocated irqs: 16
> [    0.500948] rcu: srcu_init: Setting srcu_struct sizes based on content=
ion.
> [    0.501015] Console: colour dummy device 80x25
> [    0.501016] printk: console [tty0] enabled
> [    0.501291] ACPI: Core revision 20230331
> [    0.501486] clocksource: hpet: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 133484873504 ns
> [    0.501505] APIC: Switch to symmetric I/O mode setup
> [    0.502606] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
> [    0.502610] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
> [    0.502612] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
> [    0.502614] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
> [    0.502616] AMD-Vi: Using global IVHD EFR:0x206d73ef22254ade, EFR2:0x0
> [    0.502929] Switched APIC routing to physical flat.
> [    0.503680] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.508520] Calibrating delay loop (skipped), value calculated
> using timer frequency.. 3393.59 BogoMIPS (lpj=3D1696795)
> [    0.508525] pid_max: default: 32768 minimum: 301
> [    0.513483] LSM: initializing lsm=3Dlockdown,capability,yama,selinux,i=
ntegrity
> [    0.513500] Yama: becoming mindful.
> [    0.513505] SELinux:  Initializing.
> [    0.513628] Mount-cache hash table entries: 65536 (order: 7, 524288
> bytes, linear)
> [    0.513701] Mountpoint-cache hash table entries: 65536 (order: 7,
> 524288 bytes, linear)
> [    0.513910] Zenbleed: please update your microcode for the most optima=
l fix
> [    0.513914] x86/cpu: User Mode Instruction Prevention (UMIP) activated
> [    0.513947] LVT offset 1 assigned for vector 0xf9
> [    0.514017] LVT offset 2 assigned for vector 0xf4
> [    0.514035] process: using mwait in idle threads
> [    0.514039] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
> [    0.514042] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB=
 0
> [    0.514048] Spectre V1 : Mitigation: usercopy/swapgs barriers and
> __user pointer sanitization
> [    0.514052] Spectre V2 : Mitigation: Retpolines
> [    0.514054] Spectre V2 : Spectre v2 / SpectreRSB mitigation:
> Filling RSB on context switch
> [    0.514057] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEX=
IT
> [    0.514059] Spectre V2 : Enabling Speculation Barrier for firmware cal=
ls
> [    0.514061] RETBleed: Mitigation: untrained return thunk
> [    0.514064] Spectre V2 : mitigation: Enabling conditional Indirect
> Branch Prediction Barrier
> [    0.514067] Spectre V2 : Selecting STIBP always-on mode to
> complement retbleed mitigation
> [    0.514069] Spectre V2 : User space: Mitigation: STIBP always-on prote=
ction
> [    0.514072] Speculative Store Bypass: Mitigation: Speculative Store
> Bypass disabled via prctl
> [    0.518637] Freeing SMP alternatives memory: 32K
> [    0.621513] smpboot: CPU0: AMD Ryzen 7 PRO 4750U with Radeon
> Graphics (family: 0x17, model: 0x60, stepping: 0x1)
> [    0.621513] cblist_init_generic: Setting adjustable number of
> callback queues.
> [    0.621513] cblist_init_generic: Setting shift to 4 and lim to 1.
> [    0.621513] cblist_init_generic: Setting adjustable number of
> callback queues.
> [    0.621513] cblist_init_generic: Setting shift to 4 and lim to 1.
> [    0.621513] cblist_init_generic: Setting adjustable number of
> callback queues.
> [    0.621513] cblist_init_generic: Setting shift to 4 and lim to 1.
> [    0.621513] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
> [    0.621513] ... version:                0
> [    0.621513] ... bit width:              48
> [    0.621513] ... generic registers:      6
> [    0.621513] ... value mask:             0000ffffffffffff
> [    0.621513] ... max period:             00007fffffffffff
> [    0.621513] ... fixed-purpose events:   0
> [    0.621513] ... event mask:             000000000000003f
> [    0.621513] rcu: Hierarchical SRCU implementation.
> [    0.621513] rcu:     Max phase no-delay instances is 400.
> [    0.621513] NMI watchdog: Enabled. Permanently consumes one hw-PMU cou=
nter.
> [    0.621513] smp: Bringing up secondary CPUs ...
> [    0.621513] x86: Booting SMP configuration:
> [    0.621513] .... node  #0, CPUs:        #1
> [    0.621679] Spectre V2 : Update user space SMT mitigation: STIBP alway=
s-on
> [    0.621711]   #2  #3  #4  #5  #6  #7  #8  #9 #10 #11 #12 #13 #14 #15
> [    0.626773] smp: Brought up 1 node, 16 CPUs
> [    0.626773] smpboot: Max logical packages: 1
> [    0.626773] smpboot: Total of 16 processors activated (54297.44 BogoMI=
PS)
> [    2.007866] node 0 deferred pages initialised in 1380ms
> [    2.009594] devtmpfs: initialized
> [    2.009594] x86/mm: Memory block size: 128MB
> [    2.011544] ACPI: PM: Registering ACPI NVS region [mem
> 0x09f00000-0x09f0ffff] (65536 bytes)
> [    2.011549] ACPI: PM: Registering ACPI NVS region [mem
> 0xca97e000-0xcc97dfff] (33554432 bytes)
> [    2.011922] clocksource: jiffies: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 1911260446275000 ns
> [    2.011961] futex hash table entries: 4096 (order: 6, 262144 bytes, li=
near)
> [    2.012019] pinctrl core: initialized pinctrl subsystem
> [    2.012101] PM: RTC time: 04:55:05, date: 2023-08-08
> [    2.012203] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    2.012807] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allo=
cations
> [    2.013142] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for
> atomic allocations
> [    2.013473] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool
> for atomic allocations
> [    2.013494] audit: initializing netlink subsys (disabled)
> [    2.013550] audit: type=3D2000 audit(1691470504.512:1):
> state=3Dinitialized audit_enabled=3D0 res=3D1
> [    2.013607] thermal_sys: Registered thermal governor 'fair_share'
> [    2.013608] thermal_sys: Registered thermal governor 'bang_bang'
> [    2.013611] thermal_sys: Registered thermal governor 'step_wise'
> [    2.013613] thermal_sys: Registered thermal governor 'user_space'
> [    2.013615] thermal_sys: Registered thermal governor 'power_allocator'
> [    2.013623] EISA bus registered
> [    2.013639] cpuidle: using governor ladder
> [    2.014527] cpuidle: using governor menu
> [    2.014572] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    2.014632] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem
> 0xf8000000-0xfbffffff] (base 0xf8000000)
> [    2.014640] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved
> as E820 entry
> [    2.014650] PCI: Using configuration type 1 for base access
> [    2.015098] kprobes: kprobe jump-optimization is enabled. All
> kprobes are optimized if possible.
> [    2.074938] HugeTLB: registered 1.00 GiB page size, pre-allocated 12 p=
ages
> [    2.074945] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB pag=
e
> [    2.074948] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pa=
ges
> [    2.074950] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
> [    2.075008] cryptd: max_cpu_qlen set to 1000
> [    2.075606] ACPI: Added _OSI(Module Device)
> [    2.075608] ACPI: Added _OSI(Processor Device)
> [    2.075610] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    2.075612] ACPI: Added _OSI(Processor Aggregator Device)
> [    2.090407] ACPI: 13 ACPI AML tables successfully acquired and loaded
> [    2.092201] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
> [    2.183018] ACPI: EC: EC started
> [    2.183018] ACPI: EC: interrupt blocked
> [    2.183246] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
> [    2.183253] ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC used to handle
> transactions
> [    2.183260] ACPI: Interpreter enabled
> [    2.183291] ACPI: PM: (supports S0 S3 S4 S5)
> [    2.183295] ACPI: Using IOAPIC for interrupt routing
> [    2.184510] PCI: Using host bridge windows from ACPI; if necessary,
> use "pci=3Dnocrs" and report a bug
> [    2.184516] PCI: Using E820 reservations for host bridge windows
> [    2.184798] ACPI: Enabled 3 GPEs in block 00 to 1F
> [    2.185744] ACPI: \_SB_.PCI0.GPP5.PXSX.WRST: New power resource
> [    2.186752] ACPI: \_SB_.P0S0: New power resource
> [    2.186778] ACPI: \_SB_.P3S0: New power resource
> [    2.186851] ACPI: \_SB_.P0S1: New power resource
> [    2.186876] ACPI: \_SB_.P3S1: New power resource
> [    2.193291] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    2.193298] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM
> ClockPM Segments MSI EDR HPX-Type3]
> [    2.193371] acpi PNP0A08:00: _OSC: platform does not support
> [SHPCHotplug LTR DPC]
> [    2.193497] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME
> AER PCIeCapability]
> [    2.193501] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain
> 0000 [bus 00-3f] only partially covers this bridge
> [    2.193790] PCI host bridge to bus 0000:00
> [    2.193793] pci_bus 0000:00: root bus resource [mem
> 0x000a0000-0x000effff window]
> [    2.193797] pci_bus 0000:00: root bus resource [mem
> 0xd0000000-0xf7ffffff window]
> [    2.193799] pci_bus 0000:00: root bus resource [mem
> 0xfc000000-0xfdffffff window]
> [    2.193802] pci_bus 0000:00: root bus resource [mem
> 0x830000000-0xffffffffff window]
> [    2.193805] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
> [    2.193807] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wind=
ow]
> [    2.193809] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    2.193823] pci 0000:00:00.0: [1022:1630] type 00 class 0x060000
> [    2.193901] pci 0000:00:00.2: [1022:1631] type 00 class 0x080600
> [    2.193975] pci 0000:00:01.0: [1022:1632] type 00 class 0x060000
> [    2.194058] pci 0000:00:02.0: [1022:1632] type 00 class 0x060000
> [    2.194126] pci 0000:00:02.1: [1022:1634] type 01 class 0x060400
> [    2.194185] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
> [    2.194287] pci 0000:00:02.2: [1022:1634] type 01 class 0x060400
> [    2.194344] pci 0000:00:02.2: PME# supported from D0 D3hot D3cold
> [    2.194450] pci 0000:00:02.4: [1022:1634] type 01 class 0x060400
> [    2.194507] pci 0000:00:02.4: PME# supported from D0 D3hot D3cold
> [    2.194612] pci 0000:00:08.0: [1022:1632] type 00 class 0x060000
> [    2.194684] pci 0000:00:08.1: [1022:1635] type 01 class 0x060400
> [    2.194706] pci 0000:00:08.1: enabling Extended Tags
> [    2.194736] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
> [    2.194864] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
> [    2.194967] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
> [    2.195116] pci 0000:00:18.0: [1022:1448] type 00 class 0x060000
> [    2.195165] pci 0000:00:18.1: [1022:1449] type 00 class 0x060000
> [    2.195217] pci 0000:00:18.2: [1022:144a] type 00 class 0x060000
> [    2.195265] pci 0000:00:18.3: [1022:144b] type 00 class 0x060000
> [    2.195313] pci 0000:00:18.4: [1022:144c] type 00 class 0x060000
> [    2.195366] pci 0000:00:18.5: [1022:144d] type 00 class 0x060000
> [    2.195415] pci 0000:00:18.6: [1022:144e] type 00 class 0x060000
> [    2.195464] pci 0000:00:18.7: [1022:144f] type 00 class 0x060000
> [    2.195784] pci 0000:01:00.0: [1987:5012] type 00 class 0x010802
> [    2.195829] pci 0000:01:00.0: reg 0x10: [mem 0xfd600000-0xfd603fff 64b=
it]
> [    2.196399] pci 0000:00:02.1: PCI bridge to [bus 01]
> [    2.196405] pci 0000:00:02.1:   bridge window [mem 0xfd600000-0xfd6fff=
ff]
> [    2.196448] pci 0000:02:00.0: [10ec:8168] type 00 class 0x020000
> [    2.196465] pci 0000:02:00.0: reg 0x10: [io  0x2400-0x24ff]
> [    2.196488] pci 0000:02:00.0: reg 0x18: [mem 0xfd514000-0xfd514fff 64b=
it]
> [    2.196504] pci 0000:02:00.0: reg 0x20: [mem 0xfd500000-0xfd503fff 64b=
it]
> [    2.196599] pci 0000:02:00.0: supports D1 D2
> [    2.196601] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
> [    2.196751] pci 0000:02:00.1: [10ec:816a] type 00 class 0x070002
> [    2.196767] pci 0000:02:00.1: reg 0x10: [io  0x2200-0x22ff]
> [    2.196785] pci 0000:02:00.1: reg 0x18: [mem 0xfd515000-0xfd515fff 64b=
it]
> [    2.196798] pci 0000:02:00.1: reg 0x20: [mem 0xfd504000-0xfd507fff 64b=
it]
> [    2.196879] pci 0000:02:00.1: supports D1 D2
> [    2.196881] pci 0000:02:00.1: PME# supported from D0 D1 D2 D3hot D3col=
d
> [    2.197005] pci 0000:02:00.2: [10ec:816b] type 00 class 0x070002
> [    2.197021] pci 0000:02:00.2: reg 0x10: [io  0x2100-0x21ff]
> [    2.197039] pci 0000:02:00.2: reg 0x18: [mem 0xfd516000-0xfd516fff 64b=
it]
> [    2.197052] pci 0000:02:00.2: reg 0x20: [mem 0xfd508000-0xfd50bfff 64b=
it]
> [    2.197134] pci 0000:02:00.2: supports D1 D2
> [    2.197136] pci 0000:02:00.2: PME# supported from D0 D1 D2 D3hot D3col=
d
> [    2.197258] pci 0000:02:00.3: [10ec:816c] type 00 class 0x0c0701
> [    2.197273] pci 0000:02:00.3: reg 0x10: [io  0x2000-0x20ff]
> [    2.197291] pci 0000:02:00.3: reg 0x18: [mem 0xfd517000-0xfd517fff 64b=
it]
> [    2.197304] pci 0000:02:00.3: reg 0x20: [mem 0xfd50c000-0xfd50ffff 64b=
it]
> [    2.197385] pci 0000:02:00.3: supports D1 D2
> [    2.197387] pci 0000:02:00.3: PME# supported from D0 D1 D2 D3hot D3col=
d
> [    2.197515] pci 0000:02:00.4: [10ec:816d] type 00 class 0x0c0320
> [    2.197532] pci 0000:02:00.4: reg 0x10: [mem 0xfd518000-0xfd518fff]
> [    2.197555] pci 0000:02:00.4: reg 0x18: [mem 0xfd510000-0xfd513fff 64b=
it]
> [    2.197655] pci 0000:02:00.4: PME# supported from D0 D3cold
> [    2.197832] pci 0000:00:02.2: PCI bridge to [bus 02]
> [    2.197836] pci 0000:00:02.2:   bridge window [io  0x2000-0x2fff]
> [    2.197839] pci 0000:00:02.2:   bridge window [mem 0xfd500000-0xfd5fff=
ff]
> [    2.197883] pci 0000:04:00.0: [10ec:522a] type 00 class 0xff0000
> [    2.197898] pci 0000:04:00.0: reg 0x10: [mem 0xfd400000-0xfd400fff]
> [    2.198003] pci 0000:04:00.0: supports D1 D2
> [    2.198004] pci 0000:04:00.0: PME# supported from D1 D2 D3hot D3cold
> [    2.198150] pci 0000:00:02.4: PCI bridge to [bus 04]
> [    2.198155] pci 0000:00:02.4:   bridge window [mem 0xfd400000-0xfd4fff=
ff]
> [    2.198224] pci 0000:06:00.0: [1002:1636] type 00 class 0x030000
> [    2.198236] pci 0000:06:00.0: reg 0x10: [mem
> 0x860000000-0x86fffffff 64bit pref]
> [    2.198245] pci 0000:06:00.0: reg 0x18: [mem
> 0x870000000-0x8701fffff 64bit pref]
> [    2.198251] pci 0000:06:00.0: reg 0x20: [io  0x1000-0x10ff]
> [    2.198257] pci 0000:06:00.0: reg 0x24: [mem 0xfd300000-0xfd37ffff]
> [    2.198266] pci 0000:06:00.0: enabling Extended Tags
> [    2.198278] pci 0000:06:00.0: BAR 0: assigned to efifb
> [    2.198316] pci 0000:06:00.0: PME# supported from D1 D2 D3hot D3cold
> [    2.198349] pci 0000:06:00.0: 126.016 Gb/s available PCIe
> bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:08.1 (capable
> of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
> [    2.198427] pci 0000:06:00.2: [1022:15df] type 00 class 0x108000
> [    2.198441] pci 0000:06:00.2: reg 0x18: [mem 0xfd200000-0xfd2fffff]
> [    2.198452] pci 0000:06:00.2: reg 0x24: [mem 0xfd3c0000-0xfd3c1fff]
> [    2.198460] pci 0000:06:00.2: enabling Extended Tags
> [    2.198548] pci 0000:06:00.3: [1022:1639] type 00 class 0x0c0330
> [    2.198560] pci 0000:06:00.3: reg 0x10: [mem 0xfd000000-0xfd0fffff 64b=
it]
> [    2.198584] pci 0000:06:00.3: enabling Extended Tags
> [    2.198614] pci 0000:06:00.3: PME# supported from D0 D3hot D3cold
> [    2.198683] pci 0000:06:00.4: [1022:1639] type 00 class 0x0c0330
> [    2.198694] pci 0000:06:00.4: reg 0x10: [mem 0xfd100000-0xfd1fffff 64b=
it]
> [    2.198718] pci 0000:06:00.4: enabling Extended Tags
> [    2.198749] pci 0000:06:00.4: PME# supported from D0 D3hot D3cold
> [    2.198819] pci 0000:06:00.5: [1022:15e2] type 00 class 0x048000
> [    2.198828] pci 0000:06:00.5: reg 0x10: [mem 0xfd380000-0xfd3bffff]
> [    2.198849] pci 0000:06:00.5: enabling Extended Tags
> [    2.198878] pci 0000:06:00.5: PME# supported from D0 D3hot D3cold
> [    2.198959] pci 0000:00:08.1: PCI bridge to [bus 06]
> [    2.198963] pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
> [    2.198966] pci 0000:00:08.1:   bridge window [mem 0xfd000000-0xfd3fff=
ff]
> [    2.198970] pci 0000:00:08.1:   bridge window [mem
> 0x860000000-0x8701fffff 64bit pref]
> [    2.198987] pci_bus 0000:00: on NUMA node 0
> [    2.199129] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
> [    2.199187] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
> [    2.199228] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
> [    2.199282] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
> [    2.199332] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
> [    2.199369] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
> [    2.199406] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
> [    2.199443] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
> [    2.201970] ACPI: EC: interrupt unblocked
> [    2.201973] ACPI: EC: event unblocked
> [    2.201980] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
> [    2.201983] ACPI: EC: GPE=3D0x3
> [    2.201986] ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC initialization co=
mplete
> [    2.201989] ACPI: \_SB_.PCI0.LPC0.EC0_: EC: Used to handle
> transactions and events
> [    2.202771] iommu: Default domain type: Translated
> [    2.202771] iommu: DMA domain TLB invalidation policy: lazy mode
> [    2.202771] SCSI subsystem initialized
> [    2.202771] efivars: Registered efivars operations
> [    2.202771] NetLabel: Initializing
> [    2.202771] NetLabel:  domain hash size =3D 128
> [    2.202771] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
> [    2.202771] NetLabel:  unlabeled traffic allowed by default
> [    2.202771] PCI: Using ACPI for IRQ routing
> [    2.205154] PCI: pci_cache_line_size set to 64 bytes
> [    2.205266] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
> [    2.205268] e820: reserve RAM buffer [mem 0x09c00000-0x0bffffff]
> [    2.205268] e820: reserve RAM buffer [mem 0x09f00000-0x0bffffff]
> [    2.205269] e820: reserve RAM buffer [mem 0xc70b8000-0xc7ffffff]
> [    2.205270] e820: reserve RAM buffer [mem 0xce000000-0xcfffffff]
> [    2.205271] e820: reserve RAM buffer [mem 0x80f340000-0x80fffffff]
> [    2.205529] pci 0000:06:00.0: vgaarb: setting as boot VGA device
> [    2.205529] pci 0000:06:00.0: vgaarb: bridge control possible
> [    2.205529] pci 0000:06:00.0: vgaarb: VGA device added:
> decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
> [    2.205530] vgaarb: loaded
> [    2.205575] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> [    2.205579] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
> [    2.207556] clocksource: Switched to clocksource hpet
> [    2.207697] VFS: Disk quotas dquot_6.6.0
> [    2.207707] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 by=
tes)
> [    2.207752] pnp: PnP ACPI init
> [    2.208010] system 00:00: [io  0x0f50-0x0f51] has been reserved
> [    2.208015] system 00:00: [mem 0xfec00000-0xfec01fff] could not be res=
erved
> [    2.208018] system 00:00: [mem 0xfee00000-0xfee00fff] has been reserve=
d
> [    2.208021] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserve=
d
> [    2.208317] system 00:02: [io  0x04d0-0x04d1] has been reserved
> [    2.208321] system 00:02: [io  0x0530-0x0537] has been reserved
> [    2.208324] system 00:02: [io  0x0400-0x0427] has been reserved
> [    2.208326] system 00:02: [io  0x0430] has been reserved
> [    2.208328] system 00:02: [io  0x0440-0x0447] has been reserved
> [    2.208331] system 00:02: [io  0x0b00-0x0b1f] has been reserved
> [    2.208334] system 00:02: [io  0x0b20-0x0b3f] has been reserved
> [    2.208336] system 00:02: [io  0x0c00-0x0c01] has been reserved
> [    2.208339] system 00:02: [io  0x0c14] has been reserved
> [    2.208341] system 00:02: [io  0x0c50-0x0c52] has been reserved
> [    2.208344] system 00:02: [io  0x0cd0-0x0cd1] has been reserved
> [    2.208346] system 00:02: [io  0x0cd2-0x0cd3] has been reserved
> [    2.208349] system 00:02: [io  0x0cd4-0x0cd5] has been reserved
> [    2.208351] system 00:02: [io  0x0cd6-0x0cd7] has been reserved
> [    2.208354] system 00:02: [io  0x0cd8-0x0cdf] has been reserved
> [    2.208356] system 00:02: [io  0x0cf9] could not be reserved
> [    2.208359] system 00:02: [io  0x8100-0x81ff window] has been reserved
> [    2.208362] system 00:02: [io  0x8200-0x82ff window] has been reserved
> [    2.208424] system 00:03: [mem 0x000e0000-0x000fffff] could not be res=
erved
> [    2.208427] system 00:03: [mem 0xff000000-0xffffffff] has been reserve=
d
> [    2.208430] system 00:03: [mem 0xfec10000-0xfec1001f] has been reserve=
d
> [    2.208432] system 00:03: [mem 0xfed00000-0xfed003ff] has been reserve=
d
> [    2.208435] system 00:03: [mem 0xfed61000-0xfed613ff] has been reserve=
d
> [    2.208438] system 00:03: [mem 0xfed80000-0xfed80fff] has been reserve=
d
> [    2.218099] pnp: PnP ACPI: found 6 devices
> [    2.224807] clocksource: acpi_pm: mask: 0xffffff max_cycles:
> 0xffffff, max_idle_ns: 2085701024 ns
> [    2.224931] NET: Registered PF_INET protocol family
> [    2.225427] IP idents hash table entries: 262144 (order: 9, 2097152
> bytes, linear)
> [    2.228471] tcp_listen_portaddr_hash hash table entries: 16384
> (order: 6, 262144 bytes, linear)
> [    2.228520] Table-perturb hash table entries: 65536 (order: 6,
> 262144 bytes, linear)
> [    2.228722] TCP established hash table entries: 262144 (order: 9,
> 2097152 bytes, linear)
> [    2.229223] TCP bind hash table entries: 65536 (order: 9, 2097152
> bytes, linear)
> [    2.229344] TCP: Hash tables configured (established 262144 bind 65536=
)
> [    2.229459] UDP hash table entries: 16384 (order: 7, 524288 bytes, lin=
ear)
> [    2.229583] UDP-Lite hash table entries: 16384 (order: 7, 524288
> bytes, linear)
> [    2.229677] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    2.229685] NET: Registered PF_XDP protocol family
> [    2.229702] pci 0000:00:02.1: PCI bridge to [bus 01]
> [    2.229708] pci 0000:00:02.1:   bridge window [mem 0xfd600000-0xfd6fff=
ff]
> [    2.229714] pci 0000:00:02.2: PCI bridge to [bus 02]
> [    2.229717] pci 0000:00:02.2:   bridge window [io  0x2000-0x2fff]
> [    2.229721] pci 0000:00:02.2:   bridge window [mem 0xfd500000-0xfd5fff=
ff]
> [    2.229726] pci 0000:00:02.4: PCI bridge to [bus 04]
> [    2.229729] pci 0000:00:02.4:   bridge window [mem 0xfd400000-0xfd4fff=
ff]
> [    2.229736] pci 0000:00:08.1: PCI bridge to [bus 06]
> [    2.229738] pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
> [    2.229742] pci 0000:00:08.1:   bridge window [mem 0xfd000000-0xfd3fff=
ff]
> [    2.229745] pci 0000:00:08.1:   bridge window [mem
> 0x860000000-0x8701fffff 64bit pref]
> [    2.229751] pci_bus 0000:00: resource 4 [mem 0x000a0000-0x000effff win=
dow]
> [    2.229754] pci_bus 0000:00: resource 5 [mem 0xd0000000-0xf7ffffff win=
dow]
> [    2.229756] pci_bus 0000:00: resource 6 [mem 0xfc000000-0xfdffffff win=
dow]
> [    2.229758] pci_bus 0000:00: resource 7 [mem 0x830000000-0xffffffffff =
window]
> [    2.229761] pci_bus 0000:00: resource 8 [io  0x0000-0x0cf7 window]
> [    2.229763] pci_bus 0000:00: resource 9 [io  0x0d00-0xffff window]
> [    2.229766] pci_bus 0000:01: resource 1 [mem 0xfd600000-0xfd6fffff]
> [    2.229768] pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
> [    2.229770] pci_bus 0000:02: resource 1 [mem 0xfd500000-0xfd5fffff]
> [    2.229773] pci_bus 0000:04: resource 1 [mem 0xfd400000-0xfd4fffff]
> [    2.229775] pci_bus 0000:06: resource 0 [io  0x1000-0x1fff]
> [    2.229777] pci_bus 0000:06: resource 1 [mem 0xfd000000-0xfd3fffff]
> [    2.229779] pci_bus 0000:06: resource 2 [mem
> 0x860000000-0x8701fffff 64bit pref]
> [    2.230282] pci 0000:06:00.3: extending delay after power-on from
> D3hot to 20 msec
> [    2.230440] pci 0000:06:00.4: extending delay after power-on from
> D3hot to 20 msec
> [    2.230524] PCI: CLS 32 bytes, default 64
> [    2.230550] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters suppo=
rted
> [    2.230610] pci 0000:00:01.0: Adding to iommu group 0
> [    2.230626] pci 0000:00:02.0: Adding to iommu group 1
> [    2.230638] pci 0000:00:02.1: Adding to iommu group 2
> [    2.230650] pci 0000:00:02.2: Adding to iommu group 3
> [    2.230652] Trying to unpack rootfs image as initramfs...
> [    2.230660] pci 0000:00:02.4: Adding to iommu group 4
> [    2.230676] pci 0000:00:08.0: Adding to iommu group 5
> [    2.230685] pci 0000:00:08.1: Adding to iommu group 5
> [    2.230701] pci 0000:00:14.0: Adding to iommu group 6
> [    2.230710] pci 0000:00:14.3: Adding to iommu group 6
> [    2.230743] pci 0000:00:18.0: Adding to iommu group 7
> [    2.230753] pci 0000:00:18.1: Adding to iommu group 7
> [    2.230762] pci 0000:00:18.2: Adding to iommu group 7
> [    2.230771] pci 0000:00:18.3: Adding to iommu group 7
> [    2.230781] pci 0000:00:18.4: Adding to iommu group 7
> [    2.230791] pci 0000:00:18.5: Adding to iommu group 7
> [    2.230800] pci 0000:00:18.6: Adding to iommu group 7
> [    2.230809] pci 0000:00:18.7: Adding to iommu group 7
> [    2.230819] pci 0000:01:00.0: Adding to iommu group 8
> [    2.230845] pci 0000:02:00.0: Adding to iommu group 9
> [    2.230856] pci 0000:02:00.1: Adding to iommu group 9
> [    2.230867] pci 0000:02:00.2: Adding to iommu group 9
> [    2.230878] pci 0000:02:00.3: Adding to iommu group 9
> [    2.230888] pci 0000:02:00.4: Adding to iommu group 9
> [    2.230899] pci 0000:04:00.0: Adding to iommu group 10
> [    2.230913] pci 0000:06:00.0: Adding to iommu group 5
> [    2.230918] pci 0000:06:00.2: Adding to iommu group 5
> [    2.230923] pci 0000:06:00.3: Adding to iommu group 5
> [    2.230929] pci 0000:06:00.4: Adding to iommu group 5
> [    2.230934] pci 0000:06:00.5: Adding to iommu group 5
> [    2.232244] pci 0000:00:00.2: can't derive routing for PCI INT A
> [    2.232253] pci 0000:00:00.2: PCI INT A: not connected
> [    2.232479] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
> [    2.232483] AMD-Vi: Extended features (0x206d73ef22254ade, 0x0):
> PPR X2APIC NX GT IA GA PC GA_vAPIC
> [    2.232490] AMD-Vi: Interrupt remapping enabled
> [    2.232491] AMD-Vi: X2APIC enabled
> [    2.232550] AMD-Vi: Virtual APIC enabled
> [    2.232656] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> [    2.232659] software IO TLB: mapped [mem
> 0x00000000b0000000-0x00000000b4000000] (64MB)
> [    2.232710] LVT offset 0 assigned for vector 0x400
> [    2.239626] perf: AMD IBS detected (0x000003ff)
> [    2.239637] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters=
/bank).
> [    2.240406] Initialise system trusted keyrings
> [    2.240421] Key type blacklist registered
> [    2.240488] workingset: timestamp_bits=3D46 max_order=3D23 bucket_orde=
r=3D0
> [    2.240515] zbud: loaded
> [    2.240891] integrity: Platform Keyring initialized
> [    2.240897] Key type asymmetric registered
> [    2.240901] Asymmetric key parser 'x509' registered
> [    2.851639] Freeing initrd memory: 7872K
> [    2.855303] Block layer SCSI generic (bsg) driver version 0.4
> loaded (major 248)
> [    2.855374] io scheduler mq-deadline registered
> [    2.855898] atomic64_test: passed for x86-64 platform with CX8 and wit=
h SSE
> [    2.856258] pcieport 0000:00:02.1: PME: Signaling with IRQ 26
> [    2.856434] pcieport 0000:00:02.2: PME: Signaling with IRQ 27
> [    2.856594] pcieport 0000:00:02.4: PME: Signaling with IRQ 28
> [    2.856737] pcieport 0000:00:08.1: PME: Signaling with IRQ 29
> [    2.856877] shpchp: Standard Hot Plug PCI Controller Driver version: 0=
.4
> [    2.857113] Serial: 8250/16550 driver, 32 ports, IRQ sharing disabled
> [    2.858510] Linux agpgart interface v0.103
> [    2.860236] tpm_tis STM0125:00: 2.0 TPM (device-id 0x0, rev-id 78)
> [    2.870941] ACPI: bus type drm_connector registered
> [    2.874043] brd: module loaded
> [    2.874133] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU]
> at 0x60,0x64 irq 1,12
> [    2.879301] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    2.879306] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    2.879377] platform eisa.0: Probing EISA bus 0
> [    2.879380] platform eisa.0: EISA: Cannot allocate resource for mainbo=
ard
> [    2.879589] ledtrig-cpu: registered to indicate activity on CPUs
> [    2.879729] [drm] Initialized simpledrm 1.0.0 20200625 for
> simple-framebuffer.0 on minor 0
> [    2.882262] input: AT Translated Set 2 keyboard as
> /devices/platform/i8042/serio0/input/input0
> [    2.890567] Console: switching to colour frame buffer device 240x67
> [    2.895350] simple-framebuffer simple-framebuffer.0: [drm] fb0:
> simpledrmdrmfb frame buffer device
> [    2.895443] hid: raw HID events driver (C) Jiri Kosina
> [    2.895555] drop_monitor: Initializing network drop monitor service
> [    2.897227] microcode: CPU1: patch_level=3D0x08600106
> [    2.897228] microcode: CPU2: patch_level=3D0x08600106
> [    2.897229] microcode: CPU3: patch_level=3D0x08600106
> [    2.897229] microcode: CPU6: patch_level=3D0x08600106
> [    2.897230] microcode: CPU7: patch_level=3D0x08600106
> [    2.897229] microcode: CPU4: patch_level=3D0x08600106
> [    2.897230] microcode: CPU5: patch_level=3D0x08600106
> [    2.897232] microcode: CPU0: patch_level=3D0x08600106
> [    2.897234] microcode: CPU9: patch_level=3D0x08600106
> [    2.897233] microcode: CPU8: patch_level=3D0x08600106
> [    2.897234] microcode: CPU12: patch_level=3D0x08600106
> [    2.897236] microcode: CPU11: patch_level=3D0x08600106
> [    2.897237] microcode: CPU13: patch_level=3D0x08600106
> [    2.897238] microcode: CPU14: patch_level=3D0x08600106
> [    2.897239] microcode: CPU15: patch_level=3D0x08600106
> [    2.898929] microcode: CPU10: patch_level=3D0x08600106
> [    2.898960] microcode: Microcode Update Driver: v2.2.
> [    2.899193] resctrl: L3 allocation detected
> [    2.899218] resctrl: MB allocation detected
> [    2.899227] resctrl: L3 monitoring detected
> [    2.899238] IPI shorthand broadcast: enabled
> [    2.900148] registered taskstats version 1
> [    2.901124] Loading compiled-in X.509 certificates
> [    2.908830] Loaded X.509 cert 'Build time autogenerated kernel key:
> c3f6410771969a106539f8fc9ecf7d841a5c86f2'
> [    2.911810] zswap: loaded using pool lz4/zbud
> [    2.914159] debug_vm_pgtable: [debug_vm_pgtable         ]:
> Validating architecture page table helpers
> [    2.914562] Key type .fscrypt registered
> [    2.914843] Key type fscrypt-provisioning registered
> [    2.915583] Loading compiled-in module X.509 certificates
> [    2.916218] Loaded X.509 cert 'Build time autogenerated kernel key:
> c3f6410771969a106539f8fc9ecf7d841a5c86f2'
> [    2.916517] ima: Allocated hash algorithm: sha1
> [    2.933417] ima: No architecture policies found
> [    2.936611] alg: No test for 842 (842-scomp)
> [    2.936991] alg: No test for 842 (842-generic)
> [    3.002458] PM:   Magic number: 3:924:918
> [    3.003296] clockevents clockevent11: hash matches
> [    3.003872] RAS: Correctable Errors collector initialized.
> [    3.004190] Lockdown: swapper/0: hibernation is restricted; see man
> kernel_lockdown.7
> [    3.005611] Unstable clock detected, switching default tracing
> clock to "global"
>               If you want to keep using the local clock, then add:
>                 "trace_clock=3Dlocal"
>               on the kernel command line
> [    3.008765] clk: Disabling unused clocks
> [    3.010745] Freeing unused decrypted memory: 2036K
> [    3.011905] Freeing unused kernel image (initmem) memory: 2460K
> [    3.019567] Write protecting the kernel read-only data: 18432k
> [    3.021213] Freeing unused kernel image (rodata/data gap) memory: 392K
> [    3.055472] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [    3.056084] rodata_test: all tests were successful
> [    3.056563] Run /init as init process
> [    3.057509]   with arguments:
> [    3.057515]     /init
> [    3.057516]     dolvm
> [    3.057517]   with environment:
> [    3.057518]     HOME=3D/
> [    3.057519]     TERM=3Dlinux
> [    3.057520]     BOOT_IMAGE=3D/boot/vmlinuz-6.4.7-hardened1-x86_64+
> [    3.057520]     real_root=3D/dev/vg0/root
> [    3.057521]     crypt_root=3D/dev/nvme0n1p2
> [    3.436266] udevd[2062]: starting version 3.2.10
> [    3.437397] udevd[2063]: starting eudev-3.2.10
> [    3.469229] ACPI: bus type USB registered
> [    3.469288] usbcore: registered new interface driver usbfs
> [    3.469304] usbcore: registered new interface driver hub
> [    3.469327] usbcore: registered new device driver usb
> [    3.473529] AVX2 version of gcm_enc/dec engaged.
> [    3.473610] AES CTR mode by8 optimization enabled
> [    3.476212] ehci-pci 0000:02:00.4: EHCI Host Controller
> [    3.476221] ehci-pci 0000:02:00.4: new USB bus registered, assigned
> bus number 1
> [    3.476293] ehci-pci 0000:02:00.4: irq 32, io mem 0xfd518000
> [    3.482595] ehci-pci 0000:02:00.4: USB 0.0 started, EHCI 1.00
> [    3.482693] usb usb1: New USB device found, idVendor=3D1d6b,
> idProduct=3D0002, bcdDevice=3D 6.04
> [    3.482698] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    3.482700] usb usb1: Product: EHCI Host Controller
> [    3.482702] usb usb1: Manufacturer: Linux 6.4.7-hardened1-x86_64+ ehci=
_hcd
> [    3.482704] usb usb1: SerialNumber: 0000:02:00.4
> [    3.482883] hub 1-0:1.0: USB hub found
> [    3.482890] hub 1-0:1.0: 1 port detected
> [    3.484260] r8169 0000:02:00.0 eth0: RTL8168ep/8111ep,
> 8c:8c:aa:c2:92:08, XID 502, IRQ 33
> [    3.484266] r8169 0000:02:00.0 eth0: jumbo features [frames: 9194
> bytes, tx checksumming: ko]
> [    3.484747] xhci_hcd 0000:06:00.3: xHCI Host Controller
> [    3.484754] xhci_hcd 0000:06:00.3: new USB bus registered, assigned
> bus number 2
> [    3.484846] xhci_hcd 0000:06:00.3: hcc params 0x0268ffe5 hci
> version 0x110 quirks 0x0000020000000410
> [    3.485009] nvme 0000:01:00.0: platform quirk: setting simple suspend
> [    3.485146] nvme nvme0: pci function 0000:01:00.0
> [    3.485730] xhci_hcd 0000:06:00.3: xHCI Host Controller
> [    3.485734] xhci_hcd 0000:06:00.3: new USB bus registered, assigned
> bus number 3
> [    3.485737] xhci_hcd 0000:06:00.3: Host supports USB 3.1 Enhanced Supe=
rSpeed
> [    3.485777] usb usb2: New USB device found, idVendor=3D1d6b,
> idProduct=3D0002, bcdDevice=3D 6.04
> [    3.485780] usb usb2: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    3.485782] usb usb2: Product: xHCI Host Controller
> [    3.485783] usb usb2: Manufacturer: Linux 6.4.7-hardened1-x86_64+ xhci=
-hcd
> [    3.485784] usb usb2: SerialNumber: 0000:06:00.3
> [    3.485925] hub 2-0:1.0: USB hub found
> [    3.485933] hub 2-0:1.0: 4 ports detected
> [    3.486288] usb usb3: We don't know the algorithms for LPM for this
> host, disabling LPM.
> [    3.486309] usb usb3: New USB device found, idVendor=3D1d6b,
> idProduct=3D0003, bcdDevice=3D 6.04
> [    3.486311] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    3.486313] usb usb3: Product: xHCI Host Controller
> [    3.486315] usb usb3: Manufacturer: Linux 6.4.7-hardened1-x86_64+ xhci=
-hcd
> [    3.486316] usb usb3: SerialNumber: 0000:06:00.3
> [    3.486455] hub 3-0:1.0: USB hub found
> [    3.486462] hub 3-0:1.0: 2 ports detected
> [    3.486794] xhci_hcd 0000:06:00.4: xHCI Host Controller
> [    3.486799] xhci_hcd 0000:06:00.4: new USB bus registered, assigned
> bus number 4
> [    3.486890] xhci_hcd 0000:06:00.4: hcc params 0x0268ffe5 hci
> version 0x110 quirks 0x0000020000000410
> [    3.487270] xhci_hcd 0000:06:00.4: xHCI Host Controller
> [    3.487272] xhci_hcd 0000:06:00.4: new USB bus registered, assigned
> bus number 5
> [    3.487275] xhci_hcd 0000:06:00.4: Host supports USB 3.1 Enhanced Supe=
rSpeed
> [    3.487307] usb usb4: New USB device found, idVendor=3D1d6b,
> idProduct=3D0002, bcdDevice=3D 6.04
> [    3.487309] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    3.487311] usb usb4: Product: xHCI Host Controller
> [    3.487312] usb usb4: Manufacturer: Linux 6.4.7-hardened1-x86_64+ xhci=
-hcd
> [    3.487313] usb usb4: SerialNumber: 0000:06:00.4
> [    3.487472] hub 4-0:1.0: USB hub found
> [    3.487480] hub 4-0:1.0: 4 ports detected
> [    3.487833] usb usb5: We don't know the algorithms for LPM for this
> host, disabling LPM.
> [    3.487854] usb usb5: New USB device found, idVendor=3D1d6b,
> idProduct=3D0003, bcdDevice=3D 6.04
> [    3.487856] usb usb5: New USB device strings: Mfr=3D3, Product=3D2,
> SerialNumber=3D1
> [    3.487858] usb usb5: Product: xHCI Host Controller
> [    3.487859] usb usb5: Manufacturer: Linux 6.4.7-hardened1-x86_64+ xhci=
-hcd
> [    3.487860] usb usb5: SerialNumber: 0000:06:00.4
> [    3.487989] hub 5-0:1.0: USB hub found
> [    3.487996] hub 5-0:1.0: 2 ports detected
> [    3.489678] nvme nvme0: missing or invalid SUBNQN field.
> [    3.489719] nvme nvme0: Shutdown timeout set to 10 seconds
> [    3.491604] nvme nvme0: 8/0/0 default/read/poll queues
> [    3.492491] nvme nvme0: Ignoring bogus Namespace Identifiers
> [    3.493872]  nvme0n1: p1 p2
> [    3.598694] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is
> disabled. Duplicate IMA measurements will not be recorded in the IMA
> log.
> [    3.598726] device-mapper: uevent: version 1.0.3
> [    3.598801] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01)
> initialised: dm-devel@redhat.com
> [   16.768376] Key type trusted registered
> [   16.771145] Key type encrypted registered
> [   16.979943] EXT4-fs (dm-1): mounted filesystem
> efe699c5-b047-4682-9393-5c1689ec3b2c ro with ordered data mode. Quota
> mode: none.
> [   17.040075] SELinux:  Permission cmd in class io_uring not defined in =
policy.
> [   17.040585] SELinux: the above unknown classes and permissions will
> be allowed
> [   17.044361] SELinux:  policy capability network_peer_controls=3D1
> [   17.044841] SELinux:  policy capability open_perms=3D1
> [   17.045136] SELinux:  policy capability extended_socket_class=3D1
> [   17.045414] SELinux:  policy capability always_check_network=3D0
> [   17.045703] SELinux:  policy capability cgroup_seclabel=3D1
> [   17.045983] SELinux:  policy capability nnp_nosuid_transition=3D1
> [   17.046260] SELinux:  policy capability genfs_seclabel_symlinks=3D0
> [   17.046535] SELinux:  policy capability ioctl_skip_cloexec=3D0
> [   17.076850] audit: type=3D1403 audit(1691470519.574:2):
> auid=3D4294967295 ses=3D4294967295 lsm=3Dselinux res=3D1
> [   17.089690] audit: type=3D1400 audit(1691470519.587:3): avc:  denied
> { read } for  pid=3D2608 comm=3D"openrc" name=3D"rc.conf" dev=3D"dm-1"
> ino=3D1446822 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dstaff_u:object_r:user_tmp_t tclass=3Dfile
> permissive=3D1
> [   17.091146] audit: type=3D1400 audit(1691470519.587:4): avc:  denied
> { open } for  pid=3D2608 comm=3D"openrc" path=3D"/etc/rc.conf" dev=3D"dm-=
1"
> ino=3D1446822 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dstaff_u:object_r:user_tmp_t tclass=3D
> file permissive=3D1
> [   17.229612] audit: type=3D1400 audit(1691470519.727:5): avc:  denied
> { relabelto } for  pid=3D2626 comm=3D"restorecon" name=3D"/" dev=3D"tmpfs=
"
> ino=3D1 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:var_run_t tclass=3Ddir per
> missive=3D1
> [   17.230908] audit: type=3D1400 audit(1691470519.727:6): avc:  denied
> { relabelfrom } for  pid=3D2626 comm=3D"restorecon" name=3D"initctl"
> dev=3D"tmpfs" ino=3D403 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:tmpfs_t tclass
> =3Dfifo_file permissive=3D1
> [   17.232321] audit: type=3D1400 audit(1691470519.727:7): avc:  denied
> { relabelto } for  pid=3D2626 comm=3D"restorecon" name=3D"initctl"
> dev=3D"tmpfs" ino=3D403 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:initctl_t tclass
> =3Dfifo_file permissive=3D1
> [   17.233217] audit: type=3D1400 audit(1691470519.727:8): avc:  denied
> { relabelfrom } for  pid=3D2626 comm=3D"restorecon" name=3D"utmp"
> dev=3D"tmpfs" ino=3D402 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:init_tmpfs_t tcla
> ss=3Dfile permissive=3D1
> [   17.234172] audit: type=3D1400 audit(1691470519.727:9): avc:  denied
> { relabelto } for  pid=3D2626 comm=3D"restorecon" name=3D"utmp" dev=3D"tm=
pfs"
> ino=3D402 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:initrc_runtime_t tc
> lass=3Dfile permissive=3D1
> [   17.235223] audit: type=3D1400 audit(1691470519.728:10): avc:  denied
>  { relabelto } for  pid=3D2626 comm=3D"restorecon" name=3D"udev" dev=3D"t=
mpfs"
> ino=3D4 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:udev_runtime_t tclas
> s=3Ddir permissive=3D1
> [   17.236371] audit: type=3D1400 audit(1691470519.728:11): avc:  denied
>  { relabelfrom } for  pid=3D2626 comm=3D"restorecon" name=3D"10" dev=3D"t=
mpfs"
> ino=3D395 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dsystem_u:object_r:tmpfs_t tclass=3Dlnk
> _file permissive=3D1
> [   18.482813] input: Power Button as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input2
> [   18.482850] ACPI: button: Power Button [PWRB]
> [   18.482947] input: Lid Switch as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input3
> [   18.484681] Monitor-Mwait will be used to enter C-1 state
> [   18.484698] ACPI: \_SB_.PLTF.C000: Found 3 idle states
> [   18.484901] ACPI: \_SB_.PLTF.C001: Found 3 idle states
> [   18.485051] ACPI: \_SB_.PLTF.C002: Found 3 idle states
> [   18.485240] ACPI: \_SB_.PLTF.C003: Found 3 idle states
> [   18.485418] ACPI: \_SB_.PLTF.C004: Found 3 idle states
> [   18.485611] ACPI: \_SB_.PLTF.C005: Found 3 idle states
> [   18.485979] ACPI: \_SB_.PLTF.C006: Found 3 idle states
> [   18.486177] ACPI: \_SB_.PLTF.C007: Found 3 idle states
> [   18.486423] ACPI: \_SB_.PLTF.C008: Found 3 idle states
> [   18.486685] ACPI: \_SB_.PLTF.C009: Found 3 idle states
> [   18.486862] ACPI: \_SB_.PLTF.C00A: Found 3 idle states
> [   18.487031] ACPI: \_SB_.PLTF.C00B: Found 3 idle states
> [   18.487376] ACPI: \_SB_.PLTF.C00C: Found 3 idle states
> [   18.487586] ACPI: \_SB_.PLTF.C00D: Found 3 idle states
> [   18.487607] ACPI: button: Lid Switch [LID]
> [   18.487758] input: Sleep Button as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input4
> [   18.487819] ACPI: \_SB_.PLTF.C00E: Found 3 idle states
> [   18.488046] ACPI: button: Sleep Button [SLPB]
> [   18.488978] input: Power Button as
> /devices/LNXSYSTM:00/LNXPWRBN:00/input/input5
> [   18.489236] ACPI: button: Power Button [PWRF]
> [   18.489606] ACPI: \_SB_.PLTF.C00F: Found 3 idle states
> [   18.494102] rtc_cmos 00:01: RTC can wake from S4
> [   18.494472] rtc_cmos 00:01: registered as rtc0
> [   18.494524] rtc_cmos 00:01: setting system clock to
> 2023-08-08T04:55:21 UTC (1691470521)
> [   18.494555] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes
> nvram, hpet irqs
> [   18.496522] ACPI: video: Video Device [VGA] (multi-head: yes  rom:
> no  post: no)
> [   18.497088] input: Video Bus as
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:08/LNXVIDEO:00/input/i=
nput6
> [   18.499165] ACPI: AC: AC Adapter [AC] (on-line)
> [   18.507075] ACPI: battery: Slot [BAT0] (battery present)
> [   18.508358] serial 0000:02:00.1: enabling device (0000 -> 0003)
> [   18.510269] piix4_smbus 0000:00:14.0: SMBus Host Controller at
> 0xb00, revision 0
> [   18.510276] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus
> port selection
> [   18.531121] 0000:02:00.1: ttyS4 at I/O 0x2200 (irq =3D 62, base_baud
> =3D 115200) is a 16550A
> [   18.532326] pstore: Using crash dump compression: deflate
> [   18.538546] rtsx_pci 0000:04:00.0: enabling device (0000 -> 0002)
> [   18.538797] serial 0000:02:00.2: enabling device (0000 -> 0003)
> [   18.541810] acpi_cpufreq: overriding BIOS provided _PSD data
> [   18.544727] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host
> Controller at 0xb20
> [   18.579489] r8169 0000:02:00.0 enp2s0f0: renamed from eth0
> [   18.584265] 0000:02:00.2: ttyS5 at I/O 0x2100 (irq =3D 65, base_baud
> =3D 115200) is a 16550A
> [   18.586242] ccp 0000:06:00.2: enabling device (0000 -> 0002)
> [   18.586516] ccp 0000:06:00.2: ccp: unable to access the device: you
> might be running a broken BIOS.
> [   18.595415] snd_rn_pci_acp3x 0000:06:00.5: enabling device (0000 -> 00=
02)
> [   18.598862] ccp 0000:06:00.2: tee enabled
> [   18.598870] ccp 0000:06:00.2: psp enabled
> [   18.612934] pstore: Registered efi_pstore as persistent store backend
> [   18.630364] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
> [   18.630533] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO =
address
> [   18.632417] Non-volatile memory driver v1.3
> [   18.639615] sp5100-tco sp5100-tco: initialized. heartbeat=3D60 sec (no=
wayout=3D0)
> [   18.650247] thinkpad_acpi: ThinkPad ACPI Extras v0.26
> [   18.650254] thinkpad_acpi: http://ibm-acpi.sf.net/
> [   18.650255] thinkpad_acpi: ThinkPad BIOS R19ET43W (1.27 ), EC R19HT29W
> [   18.650257] thinkpad_acpi: Lenovo ThinkPad L14 Gen 1, model 20U50001MX
> [   18.653499] thinkpad_acpi: radio switch found; radios are enabled
> [   18.653512] thinkpad_acpi: This ThinkPad has standard ACPI
> backlight brightness control, supported by the ACPI video driver
> [   18.653513] thinkpad_acpi: Disabling thinkpad-acpi brightness
> events by default...
> [   18.766028] AMD-Vi: AMD IOMMUv2 loaded and initialized
> [   18.806523] kvm_amd: TSC scaling supported
> [   18.806530] kvm_amd: Nested Virtualization enabled
> [   18.806532] kvm_amd: Nested Paging enabled
> [   18.806574] kvm_amd: Virtual VMLOAD VMSAVE supported
> [   18.806576] kvm_amd: Virtual GIF supported
> [   18.806577] kvm_amd: LBR virtualization supported
> [   18.806836] typec port0: bound usb2-port1 (ops connector_ops [usbcore]=
)
> [   18.806883] typec port0: bound usb3-port1 (ops connector_ops [usbcore]=
)
> [   18.933410] thinkpad_acpi: battery 1 registered (start 0, stop 100,
> behaviours: 0x7)
> [   18.933440] ACPI: battery: new extension: ThinkPad Battery Extension
> [   18.971966] input: ThinkPad Extra Buttons as
> /devices/platform/thinkpad_acpi/input/input8
> [   19.061266] typec port1: bound usb4-port1 (ops connector_ops [usbcore]=
)
> [   19.061292] typec port1: bound usb5-port1 (ops connector_ops [usbcore]=
)
> [   19.519445] psmouse serio1: synaptics: queried max coordinates: x
> [..5678], y [..4694]
> [   19.557743] psmouse serio1: synaptics: queried min coordinates: x
> [1266..], y [1162..]
> [   19.557757] psmouse serio1: synaptics: Your touchpad (PNP: LEN0411
> PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi
> are not used, you might want to try setting
> psmouse.synaptics_intertouch to 1 and report thi
> s to linux-input@vger.kernel.org.
> [   19.629572] psmouse serio1: synaptics: Touchpad model: 1, fw:
> 10.32, id: 0x1e2a1, caps: 0xf014a3/0x940300/0x12e800/0x500000, board
> id: 3471, fw id: 2909640
> [   19.629590] psmouse serio1: synaptics: serio: Synaptics
> pass-through port at isa0060/serio1/input0
> [   19.677679] input: SynPS/2 Synaptics TouchPad as
> /devices/platform/i8042/serio1/input/input7
> [   20.009642] mousedev: PS/2 mouse device common for all mice
> [   20.011483] [drm] amdgpu kernel modesetting enabled.
> [   20.014855] amdgpu: Virtual CRAT table created for CPU
> [   20.014869] amdgpu: Topology: Add CPU node
> [   20.015007] amdgpu 0000:06:00.0: enabling device (0006 -> 0007)
> [   20.015057] [drm] initializing kernel modesetting (RENOIR
> 0x1002:0x1636 0x17AA:0x507E 0xD1).
> [   20.015875] [drm] register mmio base: 0xFD300000
> [   20.015876] [drm] register mmio size: 524288
> [   20.017337] [drm] add ip block number 0 <soc15_common>
> [   20.017339] [drm] add ip block number 1 <gmc_v9_0>
> [   20.017340] [drm] add ip block number 2 <vega10_ih>
> [   20.017341] [drm] add ip block number 3 <psp>
> [   20.017342] [drm] add ip block number 4 <smu>
> [   20.017343] [drm] add ip block number 5 <dm>
> [   20.017344] [drm] add ip block number 6 <gfx_v9_0>
> [   20.017345] [drm] add ip block number 7 <sdma_v4_0>
> [   20.017346] [drm] add ip block number 8 <vcn_v2_0>
> [   20.017347] [drm] add ip block number 9 <jpeg_v2_0>
> [   20.017362] amdgpu 0000:06:00.0: amdgpu: Fetched VBIOS from VFCT
> [   20.017365] amdgpu: ATOM BIOS: 113-RENOIR-036
> [   20.019889] [drm] VCN decode is enabled in VM mode
> [   20.019890] [drm] VCN encode is enabled in VM mode
> [   20.021388] [drm] JPEG decode is enabled in VM mode
> [   20.024878] Console: switching to colour dummy device 80x25
> [   20.041328] amdgpu 0000:06:00.0: vgaarb: deactivate vga console
> [   20.041339] amdgpu 0000:06:00.0: amdgpu: Trusted Memory Zone (TMZ)
> feature enabled
> [   20.041358] amdgpu 0000:06:00.0: amdgpu: MODE2 reset
> [   20.041428] [drm] vm size is 262144 GB, 4 levels, block size is
> 9-bit, fragment size is 9-bit
> [   20.041439] amdgpu 0000:06:00.0: amdgpu: VRAM: 512M
> 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
> [   20.041445] amdgpu 0000:06:00.0: amdgpu: GART: 1024M
> 0x0000000000000000 - 0x000000003FFFFFFF
> [   20.041449] amdgpu 0000:06:00.0: amdgpu: AGP: 267419648M
> 0x000000F800000000 - 0x0000FFFFFFFFFFFF
> [   20.041459] [drm] Detected VRAM RAM=3D512M, BAR=3D512M
> [   20.041461] [drm] RAM width 128bits DDR4
> [   20.041778] [drm] amdgpu: 512M of VRAM memory ready
> [   20.041784] [drm] amdgpu: 15701M of GTT memory ready.
> [   20.041807] [drm] GART: num cpu pages 262144, num gpu pages 262144
> [   20.041959] [drm] PCIE GART of 1024M enabled.
> [   20.041962] [drm] PTB located at 0x000000F41FC00000
> [   20.042555] [drm] Loading DMUB firmware via PSP: version=3D0x01010026
> [   20.043582] [drm] Found VCN firmware Version ENC: 1.19 DEC: 5 VEP:
> 0 Revision: 0
> [   20.043593] amdgpu 0000:06:00.0: amdgpu: Will use PSP to load VCN firm=
ware
> [   20.207073] psmouse serio2: trackpoint: Elan TrackPoint firmware:
> 0x11, buttons: 3/3
> [   20.437673] input: TPPS/2 Elan TrackPoint as
> /devices/platform/i8042/serio1/serio2/input/input9
> [   20.754631] [drm] reserve 0x400000 from 0xf41f800000 for PSP TMR
> [   20.840698] amdgpu 0000:06:00.0: amdgpu: RAS: optional ras ta ucode
> is not available
> [   20.852005] amdgpu 0000:06:00.0: amdgpu: RAP: optional rap ta ucode
> is not available
> [   20.858204] [drm] psp gfx command LOAD_TA(0x1) failed and response
> status is (0x7)
> [   20.858436] [drm] psp gfx command INVOKE_CMD(0x3) failed and
> response status is (0x4)
> [   20.858439] amdgpu 0000:06:00.0: amdgpu: Secure display: Generic Failu=
re.
> [   20.858441] amdgpu 0000:06:00.0: amdgpu: SECUREDISPLAY: query
> securedisplay TA failed. ret 0x0
> [   20.859180] amdgpu 0000:06:00.0: amdgpu: SMU is initialized successful=
ly!
> [   20.860243] [drm] Display Core initialized with v3.2.230!
> [   20.860245] [drm] DP-HDMI FRL PCON supported
> [   20.860910] [drm] DMUB hardware initialized: version=3D0x01010026
> [   21.168466] EXT4-fs (dm-1): re-mounted
> efe699c5-b047-4682-9393-5c1689ec3b2c r/w. Quota mode: none.
> [   21.189964] EXT4-fs (dm-1): re-mounted
> efe699c5-b047-4682-9393-5c1689ec3b2c r/w. Quota mode: none.
> [   21.190008] [drm] Alt mode has timed out after 202 ms
> [   21.200002] SELinux: unable to change security options during
> remount (dev tmpfs, type=3Dtmpfs)
> [   21.392807] [drm] Alt mode has timed out after 202 ms
> [   21.394597] [drm] kiq ring mec 2 pipe 1 q 0
> [   21.397154] [drm] VCN decode and encode initialized
> successfully(under DPG Mode).
> [   21.397174] [drm] JPEG decode initialized successfully.
> [   21.399140] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
> [   21.399242] amdgpu: sdma_bitmap: 3
> [   21.416529] amdgpu: HMM registered 512MB device memory
> [   21.416582] amdgpu: Virtual CRAT table created for GPU
> [   21.417037] amdgpu: Topology: Add dGPU node [0x1636:0x1002]
> [   21.417040] kfd kfd: amdgpu: added device 1002:1636
> [   21.417085] amdgpu 0000:06:00.0: amdgpu: SE 1, SH per SE 1, CU per
> SH 8, active_cu_number 7
> [   21.417178] amdgpu 0000:06:00.0: amdgpu: ring gfx uses VM inv eng 0 on=
 hub 0
> [   21.417180] amdgpu 0000:06:00.0: amdgpu: ring gfx_low uses VM inv
> eng 1 on hub 0
> [   21.417181] amdgpu 0000:06:00.0: amdgpu: ring gfx_high uses VM inv
> eng 4 on hub 0
> [   21.417182] amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.0 uses VM
> inv eng 5 on hub 0
> [   21.417183] amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.0 uses VM
> inv eng 6 on hub 0
> [   21.417184] amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.0 uses VM
> inv eng 7 on hub 0
> [   21.417185] amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.0 uses VM
> inv eng 8 on hub 0
> [   21.417186] amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.1 uses VM
> inv eng 9 on hub 0
> [   21.417187] amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.1 uses VM
> inv eng 10 on hub 0
> [   21.417188] amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.1 uses VM
> inv eng 11 on hub 0
> [   21.417189] amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.1 uses VM
> inv eng 12 on hub 0
> [   21.417190] amdgpu 0000:06:00.0: amdgpu: ring kiq_2.1.0 uses VM inv
> eng 13 on hub 0
> [   21.417191] amdgpu 0000:06:00.0: amdgpu: ring sdma0 uses VM inv eng
> 0 on hub 1
> [   21.417191] amdgpu 0000:06:00.0: amdgpu: ring vcn_dec uses VM inv
> eng 1 on hub 1
> [   21.417192] amdgpu 0000:06:00.0: amdgpu: ring vcn_enc0 uses VM inv
> eng 4 on hub 1
> [   21.417193] amdgpu 0000:06:00.0: amdgpu: ring vcn_enc1 uses VM inv
> eng 5 on hub 1
> [   21.417194] amdgpu 0000:06:00.0: amdgpu: ring jpeg_dec uses VM inv
> eng 6 on hub 1
> [   21.418922] [drm] Initialized amdgpu 3.52.0 20150101 for
> 0000:06:00.0 on minor 1
> [   21.427179] fbcon: amdgpudrmfb (fb0) is primary device
> [   21.427433] [drm] DSC precompute is not needed.
> [   21.474248] Console: switching to colour frame buffer device 240x67
> [   21.493575] amdgpu 0000:06:00.0: [drm] fb0: amdgpudrmfb frame buffer d=
evice
> [   21.534763] EXT4-fs (dm-2): mounted filesystem
> 5df48ec6-d02b-48b1-b7d6-5e41e6a32906 r/w with ordered data mode. Quota
> mode: none.
> [   24.055828] EXT4-fs (dm-1): re-mounted
> efe699c5-b047-4682-9393-5c1689ec3b2c r/w. Quota mode: none.
> [   24.077641] EXT4-fs (dm-2): re-mounted
> 5df48ec6-d02b-48b1-b7d6-5e41e6a32906 r/w. Quota mode: none.
> [   24.742034] kauditd_printk_skb: 72 callbacks suppressed
> [   24.742039] audit: type=3D1400 audit(1691470527.877:84): avc:  denied
>  { create } for  pid=3D5654 comm=3D"mkdir" name=3D"laptop-mode-tools"
> scontext=3Dsystem_u:system_r:udev_t tcontext=3Dsystem_u:object_r:var_run_=
t
> tclass=3Ddir permissive=3D1
> [   24.812674] audit: type=3D1400 audit(1691470527.948:85): avc:  denied
>  { search } for  pid=3D5766 comm=3D"laptop_mode" name=3D"/" dev=3D"tmpfs"
> ino=3D1 scontext=3Dsystem_u:system_r:udev_t
> tcontext=3Dsystem_u:object_r:tmp_t tclass=3Ddir permissive
> =3D1
> [   24.812681] audit: type=3D1400 audit(1691470527.948:86): avc:  denied
>  { read } for  pid=3D5766 comm=3D"laptop_mode" name=3D".X11-unix"
> dev=3D"tmpfs" ino=3D4 scontext=3Dsystem_u:system_r:udev_t
> tcontext=3Dsystem_u:object_r:xdm_tmp_t tclass=3Ddir
> permissive=3D1
> [   24.812684] audit: type=3D1400 audit(1691470527.948:87): avc:  denied
>  { open } for  pid=3D5766 comm=3D"laptop_mode" path=3D"/tmp/.X11-unix"
> dev=3D"tmpfs" ino=3D4 scontext=3Dsystem_u:system_r:udev_t
> tcontext=3Dsystem_u:object_r:xdm_tmp_t tclass
> =3Ddir permissive=3D1
> [   24.812725] audit: type=3D1400 audit(1691470527.948:88): avc:  denied
>  { getattr } for  pid=3D5766 comm=3D"laptop_mode" path=3D"/tmp/.X11-unix"
> dev=3D"tmpfs" ino=3D4 scontext=3Dsystem_u:system_r:udev_t
> tcontext=3Dsystem_u:object_r:xdm_tmp_t tcl
> ass=3Ddir permissive=3D1
> [   24.812734] audit: type=3D1400 audit(1691470527.948:89): avc:  denied
>  { search } for  pid=3D5766 comm=3D"laptop_mode" name=3D".X11-unix"
> dev=3D"tmpfs" ino=3D4 scontext=3Dsystem_u:system_r:udev_t
> tcontext=3Dsystem_u:object_r:xdm_tmp_t tclass=3Ddi
> r permissive=3D1
> [   24.843800] audit: type=3D1400 audit(1691470527.979:90): avc:  denied
>  { read } for  pid=3D5812 comm=3D"openrc-run.sh" name=3D"rc.conf" dev=3D"=
dm-1"
> ino=3D1446822 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dstaff_u:object_r:user_tmp_t tcla
> ss=3Dfile permissive=3D1
> [   24.843811] audit: type=3D1400 audit(1691470527.979:91): avc:  denied
>  { open } for  pid=3D5812 comm=3D"openrc-run.sh" path=3D"/etc/rc.conf"
> dev=3D"dm-1" ino=3D1446822 scontext=3Dsystem_u:system_r:initrc_t
> tcontext=3Dstaff_u:object_r:user_tmp_t
> tclass=3Dfile permissive=3D1
> [   24.845670] audit: type=3D1400 audit(1691470527.981:92): avc:  denied
>  { write } for  pid=3D5835 comm=3D"modprobe" path=3D"/run/lock/lmt-req.lo=
ck"
> dev=3D"tmpfs" ino=3D681 scontext=3Dsystem_u:system_r:kmod_t
> tcontext=3Dsystem_u:object_r:var_lock
> _t tclass=3Dfile permissive=3D1
> [   24.919789] audit: type=3D1400 audit(1691470528.055:93): avc:  denied
>  { search } for  pid=3D6012 comm=3D"laptop_mode" name=3D"fs" dev=3D"proc"
> ino=3D20996 scontext=3Dsystem_u:system_r:udev_t
> tcontext=3Dsystem_u:object_r:sysctl_fs_t tclass=3Ddir
> permissive=3D1
> [   25.455207] NET: Registered PF_INET6 protocol family
> [   25.455575] Segment Routing with IPv6
> [   25.455581] In-situ OAM (IOAM) with IPv6
> [   36.870595] fuse: init (API version 7.38)
> [   38.357439] memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL,
> pid=3D7145 'kwin_wayland'
> [   39.801243] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   39.806991] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   39.807680] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   39.808173] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   39.808187] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   39.997303] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   40.002018] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   40.002221] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   66.799603] usb 2-2: new high-speed USB device number 2 using xhci_hcd
> [   66.927325] usb 2-2: New USB device found, idVendor=3D1a40,
> idProduct=3D0101, bcdDevice=3D 1.11
> [   66.927336] usb 2-2: New USB device strings: Mfr=3D0, Product=3D1, Ser=
ialNumber=3D0
> [   66.927341] usb 2-2: Product: USB 2.0 Hub
> [   66.974108] hub 2-2:1.0: USB hub found
> [   66.974321] hub 2-2:1.0: 4 ports detected
> [   67.356571] usb 2-2.1: new low-speed USB device number 3 using xhci_hc=
d
> [   67.571128] usb 2-2.1: New USB device found, idVendor=3D1c4f,
> idProduct=3D0002, bcdDevice=3D 1.10
> [   67.571139] usb 2-2.1: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D0
> [   67.571143] usb 2-2.1: Product: HCT Keyboard
> [   67.571146] usb 2-2.1: Manufacturer: SEM
> [   67.828605] usb 2-2.3: new low-speed USB device number 4 using xhci_hc=
d
> [   68.041939] usb 2-2.3: New USB device found, idVendor=3D046d,
> idProduct=3Dc077, bcdDevice=3D72.00
> [   68.041950] usb 2-2.3: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D0
> [   68.041954] usb 2-2.3: Product: USB Optical Mouse
> [   68.041957] usb 2-2.3: Manufacturer: Logitech
> [   69.091168] usbcore: registered new interface driver usbhid
> [   69.091176] usbhid: USB HID core driver
> [   69.147647] input: SEM HCT Keyboard as
> /devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb2/2-2/2-2.1/2-2.1:1.0/00=
03:1C4F:0002.0001/input/input10
> [   69.200027] hid-generic 0003:1C4F:0002.0001: input,hidraw0: USB HID
> v1.10 Keyboard [SEM HCT Keyboard] on usb-0000:06:00.3-2.1/input0
> [   69.200344] input: SEM HCT Keyboard Consumer Control as
> /devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb2/2-2/2-2.1/2-2.1:1.1/00=
03:1C4F:0002.0002/input/input11
> [   69.252857] input: SEM HCT Keyboard System Control as
> /devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb2/2-2/2-2.1/2-2.1:1.1/00=
03:1C4F:0002.0002/input/input12
> [   69.253071] hid-generic 0003:1C4F:0002.0002: input,hidraw1: USB HID
> v1.10 Device [SEM HCT Keyboard] on usb-0000:06:00.3-2.1/input1
> [   69.253295] input: Logitech USB Optical Mouse as
> /devices/pci0000:00/0000:00:08.1/0000:06:00.3/usb2/2-2/2-2.3/2-2.3:1.0/00=
03:046D:C077.0003/input/input13
> [   69.253578] hid-generic 0003:046D:C077.0003: input,hidraw2: USB HID
> v1.11 Mouse [Logitech USB Optical Mouse] on
> usb-0000:06:00.3-2.3/input0
> [   74.852969] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   74.858263] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   74.858622] Lockdown: elogind-daemon: hibernation is restricted;
> see man kernel_lockdown.7
> [   82.568875] usb 4-2: new full-speed USB device number 2 using xhci_hcd
> [   82.719657] usb 4-2: New USB device found, idVendor=3D1050,
> idProduct=3D0407, bcdDevice=3D 5.11
> [   82.719670] usb 4-2: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
> [   82.719674] usb 4-2: Product: YubiKey OTP+FIDO+CCID
> [   82.719677] usb 4-2: Manufacturer: Yubico
> [   82.886369] input: Yubico YubiKey OTP+FIDO+CCID as
> /devices/pci0000:00/0000:00:08.1/0000:06:00.4/usb4/4-2/4-2:1.0/0003:1050:=
0407.0004/input/input14
> [   82.938522] hid-generic 0003:1050:0407.0004: input,hidraw3: USB HID
> v1.10 Keyboard [Yubico YubiKey OTP+FIDO+CCID] on
> usb-0000:06:00.4-2/input0
> [   82.943415] hid-generic 0003:1050:0407.0005: hiddev96,hidraw4: USB
> HID v1.10 Device [Yubico YubiKey OTP+FIDO+CCID] on
> usb-0000:06:00.4-2/input1
> [  138.477415] usb 4-2: USB disconnect, device number 2
> [  254.437891] usb 4-2: new high-speed USB device number 3 using xhci_hcd
> [  254.569672] usb 4-2: New USB device found, idVendor=3D0e8d,
> idProduct=3D201c, bcdDevice=3D 2.23
> [  254.569687] usb 4-2: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [  254.569690] usb 4-2: Product: Jelly2
> [  254.569693] usb 4-2: Manufacturer: Unihertz
> [  254.569696] usb 4-2: SerialNumber: JELLY20000016085
> [  260.156839] usb 4-2: USB disconnect, device number 3
> [  260.508933] usb 4-2: new high-speed USB device number 4 using xhci_hcd
> [  260.640015] usb 4-2: New USB device found, idVendor=3D0e8d,
> idProduct=3D2005, bcdDevice=3D 2.23
> [  260.640027] usb 4-2: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [  260.640031] usb 4-2: Product: Jelly2
> [  260.640034] usb 4-2: Manufacturer: Unihertz
> [  260.640036] usb 4-2: SerialNumber: JELLY20000016085
> [  261.203390] usbcore: registered new interface driver cdc_ether
> [  261.209915] rndis_host 4-2:1.0 usb0: register 'rndis_host' at
> usb-0000:06:00.4-2, RNDIS device, 7e:74:bd:46:33:65
> [  261.209990] usbcore: registered new interface driver rndis_host
> [  262.085807] rndis_host 4-2:1.0 enp6s0f4u2: renamed from usb0
> [  262.114597] 8021q: 802.1Q VLAN Support v1.8
> [  262.194902] cfg80211: Loading compiled-in X.509 certificates for
> regulatory database
> [  262.202837] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [  262.204192] platform regulatory.0: loading
> /lib/firmware/regulatory.db failed with error -13
> [  262.204200] platform regulatory.0: Direct firmware load for
> regulatory.db failed with error -13
> [  262.204205] cfg80211: failed to load regulatory.db
> [  262.942467] NET: Registered PF_PACKET protocol family
> [  266.665290] SELinux:  Context staff_u:object_r:mozilla_home_t is
> not valid (left unmapped).
>
>     I now replied to Thorsten with some odd findings
> on my way to bisect it.
>
>     Thanks!
>
>     Jos=C3=A9.

From your 6.4 logs, it looks like your keyboard is enumerating correctly:
> i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU]
> at 0x60,0x64 irq 1,12
> serio: i8042 KBD port at 0x60,0x64 irq 1
> serio: i8042 AUX port at 0x60,0x64 irq 12
> input: AT Translated Set 2 keyboard as
> /devices/platform/i8042/serio0/input/input0

You also said that evtest works correctly. I would try diffing your
plasma logs between kernel versions to see if that sheds any light.

Raul
