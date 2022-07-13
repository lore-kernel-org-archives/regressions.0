Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BD629A3
	for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 13:08:55 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id eq6so14036861edb.6
        for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 06:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hMwe0rdT7SyoDOBgnmApSR8aVe/+Or+lmpy2VVuGPUM=;
        b=JChb+wKuptilCTlze8CjLmidtgd/qaXrd4cGYb7elwnvZ861sF/hBKRcIeZbY5kvPF
         kSBf9UYdiNceYHey0iUOtxeBU+aYRNxMe6hwy7tSxH0gSrXNh9JaB9+Dop4YnGng0e3M
         gZhrKHZa4LXVfdxUYt7oaIRMf3IOFLBwHiQvLXCgxE9XHtuHTwasZzr6yihkUnOK0qTS
         fVydBxmFC7kV4p1bP19BVz+zpUK42NtG5H0WAeRFc3NPx9AAfSySdBLBMUbgZ9zV9mAj
         SGdXbh0F03EQAlrJ6/8kMqOEqqSAjO82K+cOi6dHyaUfmgLIKCi11KYwNR3uZOWMQ4IK
         GrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hMwe0rdT7SyoDOBgnmApSR8aVe/+Or+lmpy2VVuGPUM=;
        b=RfenK11k2USi0SKcX5+mHLoLwKOWPk3X+N4t1IQmQ9mp5L+Vo45j2owNB5piCuJ4e6
         G9OtaFObKjSryjwKhrMU/qrMoHa6cVoQomHta4OGwE5oTpsEIRH4MaAe4AbAd8U1pA0K
         7sWyks5C2ZTGirGnVjVx2GEVsV+P/s1tuz6t3X8zTv/8Bj43jrrw6ZmNhC0YRwpWafk/
         /ys8QCQfs8fIGBOFATzxtuDwKC79ShfbhtFzLX28rMzTU/cHbWuZADamiuUq0T+aHOJ1
         cmwzOqQO9q3Gj0fSEwRPZhwv/ZLpw0X3u8Bxqzh29mIJz/quhXAdtE0UpKRKuv5oh6OI
         204g==
X-Gm-Message-State: AJIora+Mtuf5D7JA6Q/GrU2Ar3Loqsptg1pxnf9aY9KrKIteEGhY+bzz
	Wb5iJjwjPyenSvg8HtUq7pj0hqXtxC5iiLkwdmUjAB9JbRHBsA==
X-Google-Smtp-Source: AGRyM1t0jrurFaS/EFX9ysqrxzvCqtBpUI3RhKRo4y0mOUMKcnHw5APGFXVw1pndrMZbP9PKLmmtZO8AiH0Iomv9Tig=
X-Received: by 2002:aa7:c2d1:0:b0:43a:997:c6d8 with SMTP id
 m17-20020aa7c2d1000000b0043a0997c6d8mr4702779edp.161.1657717733314; Wed, 13
 Jul 2022 06:08:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALF=6jEe5G8+r1Wo0vvz4GjNQQhdkLT5p8uCHn6ZXhg4nsOWow@mail.gmail.com>
 <02190bee-2e1b-bea3-b716-a7c7f5aa2ff0@redhat.com>
In-Reply-To: <02190bee-2e1b-bea3-b716-a7c7f5aa2ff0@redhat.com>
From: Ben Greening <bgreening@gmail.com>
Date: Wed, 13 Jul 2022 06:08:16 -0700
Message-ID: <CALF=6jG5gmqqXo5cSFFRWRM96K0rzx3WabNdwAmdZQH=unFG7g@mail.gmail.com>
Subject: Re: [Regression] ACPI: video: Change how we determine if brightness
 key-presses are handled
To: Hans de Goede <hdegoede@redhat.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, rafael@kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans, thanks for getting back to me.

evemu-record shows events for both "Video Bus" and "Dell WMI hotkeys":

Video Bus
E: 0.000001 0001 00e0 0001 # EV_KEY / KEY_BRIGHTNESSDOWN   1
E: 0.000001 0000 0000 0000 # ------------ SYN_REPORT (0) ---------- +0ms
E: 0.000020 0001 00e0 0000 # EV_KEY / KEY_BRIGHTNESSDOWN   0
E: 0.000020 0000 0000 0000 # ------------ SYN_REPORT (0) ---------- +0ms

Dell WMI hotkeys
E: 0.000001 0004 0004 57349 # EV_MSC / MSC_SCAN             57349
E: 0.000001 0001 00e0 0001 # EV_KEY / KEY_BRIGHTNESSDOWN   1
E: 0.000001 0000 0000 0000 # ------------ SYN_REPORT (0) ---------- +0ms
E: 0.000020 0001 00e0 0000 # EV_KEY / KEY_BRIGHTNESSDOWN   0
E: 0.000020 0000 0000 0000 # ------------ SYN_REPORT (0) ---------- +0ms

Adding video.report_key_events=1 with acpi_backlight=video makes
things work like you said it would.


With acpi_backlight=video just has intel_backlight.

Without acpi_backlight=video:
    intel_backlight:
        max_brightness: 4882
        backlight control works with echo
        brightness keys make no change to brightness value

    dell_backlight:
        max_brightness: 15
        backlight control doesn't work immediately, but does on reboot
to set brightness at POST.
        brightness keys change brightness value, but you don't see the
change until reboot.

Thanks again,

Ben

On Wed, Jul 13, 2022 at 2:43 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ben,
>
> On 7/13/22 07:27, Ben Greening wrote:
> > (resending because of HTML formatting)
> > Hi, I'm on Arch Linux and upgraded from kernel 5.18.9.arch1-1 to
> > 5.18.10.arch1-1. The brightness keys don't work as well as before.
> > Gnome had 20 degrees of brightness, now it's 10, and Xfce went from 10
> > to 5. Additionally, on Gnome the brightness keys are a little slow to
> > respond and there's a bit of a stutter. Don't know why Xfce doesn't
> > stutter, but halving the degrees of brightness for both makes me
> > wonder if each press is being counted twice.
>
> Author of the troublesome patch here, sorry that this broke things
> for you.
>
> So this sounds like you are getting duplicate key-events reported,
> causing the brightness to take 2 steps on each key-press which is
> likely also causing the perceived stutter.
>
> This suggests that acpi_video_handles_brightness_key_presses()
> was returning true on your system and is now returning false.
>
> Lets confirm this theory, please run either evtest or evemu-record
> as root and then record events from the "Video Bus" device and then
> press the brightness up/down keys. Press CTRL+C to exit. After this
> repeat selecting the "Dell WMI hotkeys" device as input device.
>
> I expect both tests/recordings to show brightness key events with
> the troublesome kernel, showing that you are getting duplicate events.
>
> If this is the case then as a workaround you can add:
>
> video.report_key_events=1
>
> to the kernel commandline. This should silence the "Video Bus"
> events. Also can you provide the output of:
>
> ls /sys/class/backlight
>
> please?
>
>
> > Reverting commit 3a0cf7ab8d in acpi_video.c and rebuilding
> > 5.18.10.arch1-1 fixed it.
>
> > The laptop is a Dell Inspiron n4010 and I use "acpi_backlight=video"
> > to make the brightness keys work. Please let me know if there's any
> > hardware info you need.
>
> Note needing to add a commandline argument like this to get things
> to work is something which really should always be reported upstream,
> so that we can either adjust our heuristics; or add a quirk for your
> laptop-model so that things will just work when another user tries
> Linux on the same model.
>
> So while at it lets look into fixing this properly to.
>
> When you do not pass anything on the kernel commandline, what
> is then the output of:
>
> ls /sys/class/backlight
>
> And for each directory under there, please cd into the dir
> and then (as root) do:
>
> cat max_brightness # this gives you the range of this backlight intf.
> echo $some-value > brightness
>
> picking some-value in a range of 0-max_brightness, repeating the
> echo with different values (e.g. half-range + max) and see if
> the screens brightness changes. Please let me know which directories
> under /sys/class/backlight result in working backlight control
> and which ones do not.
>
> Also what is the output of "ls /sys/class/backlight" when
> "acpi_backlight=video" is present on the kernel commandline ?
>
> Regards,
>
> Hans
>
