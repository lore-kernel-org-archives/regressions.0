Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B4536E
	for <regressions@lists.linux.dev>; Sun, 26 Feb 2023 01:11:37 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id f23so5545460vsa.13
        for <regressions@lists.linux.dev>; Sat, 25 Feb 2023 17:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z3yOvtuOKZ65Y8wcPFoEJP3NZBSkh6uL7Wr3UDLb1mI=;
        b=HSsDGnsxT6DD+dq13DNrAN+rkVNvxescjNj3LEirpoku5xPTS4VyVAbVk4w/l0Rr1z
         nB069yllqTatdQBkUPA5bRn2+fP1ruUu1fc1pIUDLfAgU6GxuzM++OeuTACGQaX2gfvZ
         jMOe6KHXvdHMty+bkVc/ECyEZBTBv6HSEwFNmgjEAeRm7yvpeI2Wzd3vJNiWn+GVzy/Q
         50opOUKlIwcqErWc6Z1b06HbP8h9eDGAQn8xlFzgBNWHIL6euNa2ufiNgcJ3XJCxny7s
         sfIObhctWkvliJYA/QGqJ1nYJHA+pkXp9NayD5+hip8A8WFQ2OAFYKYt2tSwZy/MO6Kg
         uN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3yOvtuOKZ65Y8wcPFoEJP3NZBSkh6uL7Wr3UDLb1mI=;
        b=PUuIcKL+80aR2+Fb2rtfflhERnhYozQBKbcpJozFBE/2AzO2NIYz4A8TQCEkRsdrdY
         miBIytE0jXOQ/0113kryRgP422JVQ2rkpawZ2D34XkWFrD3hJuJK7RmdrRpWY8iTZ+cZ
         Ac/zGbLDGaY8HQonTOzLvcdAShl9FZBi1AgOkD8qAccs7Wkh6ideyStphnioweS18BP1
         1JSdlHXkSZMkcwd9iUdiz9vNwWqCiAN7bJ15rJ1gMT/tfZpMhxBI6M7ma38z2UEOjAz2
         et3QHgeGpo0ofM7TbpoPnLztEK2GMZSfD/IEFAKAypko4CZSqJ0fYcWTJz6mMgZQZ9Rh
         qmGA==
X-Gm-Message-State: AO0yUKWNOVYfUt3l505ASQpMUVy7bg6IB6MDc1E5VjOOnOsoNWWDMYUQ
	M23hBVSASpgn0gHEpnyFwoYODIFwE/7XMgS/ziuFQw==
X-Google-Smtp-Source: AK7set8gfDEGYUkFKjm7qFEk5GBdkDmBsmBomEh5CU9ofdegKezl2/MITT4ZdTT26fpyC6xR4Dd3+MOoXm1/tjFpf8M=
X-Received: by 2002:a1f:4343:0:b0:400:ea69:7082 with SMTP id
 q64-20020a1f4343000000b00400ea697082mr4973937vka.0.1677373895820; Sat, 25 Feb
 2023 17:11:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsO4=qKBF=2FRPVwW8FA4iLFh0Dt9n1BLMec3k10GUorpg@mail.gmail.com>
 <9f682c4d-e7b7-5e23-84f5-cea4fdac2085@leemhuis.info> <CABXGCsNruNKfx3d1dpneRUvn3dCqv_bM93TdJsCLeRYiP3qYaA@mail.gmail.com>
 <6bfa6d67-27ce-04b3-a1f9-3768b8a0169f@leemhuis.info>
In-Reply-To: <6bfa6d67-27ce-04b3-a1f9-3768b8a0169f@leemhuis.info>
From: David Gow <davidgow@google.com>
Date: Sun, 26 Feb 2023 09:11:23 +0800
Message-ID: <CABVgOSnCLbqHHA-gT6FwtJYKYAHt_9uwR_S2r6ZE8hm6eZaLBA@mail.gmail.com>
Subject: Re: [6.3][regression] after commit 7170b7ed6acbde523c5d362c8978c60df4c30f30
 my system stuck in initramfs forever
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, rmoar@google.com, 
	brendanhiggins@google.com, skhan@linuxfoundation.org, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003c22b705f5900b25"

--0000000000003c22b705f5900b25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 25 Feb 2023 at 23:53, Thorsten Leemhuis <linux@leemhuis.info> wrote=
:
>
> On 25.02.23 15:55, Mikhail Gavrilov wrote:
> > On Sat, Feb 25, 2023 at 7:22=E2=80=AFPM Thorsten Leemhuis <linux@leemhu=
is.info> wrote:
> >>
> >> [CCing the regression list, as it should be in the loop for regression=
s:
> >> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> >>
> >> On 25.02.23 14:51, Mikhail Gavrilov wrote:
> >>> new kernel release cycle returning with new bugs
> >>> Today my system got stuck in initramfs environment after updating to
> >>> commit d2980d8d826554fa6981d621e569a453787472f8.
> >>>
> >>> I still do not understand how to configure the network inside the
> >>> initramfs environment to grab the logs.
> >>> Since an attempt to rebuild the initramfs with all modules (dracut
> >>> --no-hostonly --force) leads to the stuck initramfs environment and
> >>> impossible entering into initramfs console.
> >>
> >> Do you see any error messages? I have problems since Friday morning as
> >> well (stuck in Fedora's initramfs) and see a lot of BPF warnings like
> >> "BPF: invalid name" and "failed to validate module". Was able to do a
> >> screenshot:
> >>
> >> https://www.leemhuis.info/files/misc/Screenshot_ktst-f36-x86-64_2023-0=
2-24_07:53:14.png
> >
> > I also seen such messages
> > https://freeimage.host/i/img-1475.HMPL26l
>
> Pretty sure that's the same problem, at least the symptoms match. If
> anyone needs a config to reproduce this, here's one of mine that shows
> the problem:
>
> https://www.leemhuis.info/files/misc/config
>
> > P.S.: I also use Fedora Rawhide.
>
> Happens for me on all Fedora 36, 37, and 38 (my rawhide build failed for
> other reasons, so I couldn't test).
>
> Ciao, Thorsten

Thanks for the report, and sorry this seems to have broken.

I've not been able to reproduce this locally yet, but I'm looking into it.

In the meantime, a few questions if you have time:
- Does this happen with CONFIG_KUNIT=3Dy as well as CONFIG_KUNIT=3Dm?
- Does this patch fix it?
https://lore.kernel.org/linux-kselftest/20230225014529.2259752-1-davidgow@g=
oogle.com/T/#u

I can't think of any particular reason this commit would cause these
problems, but there were some issues with the way these 'hooks' were
built, so it's possibly related.

Sorry again for the inconvenience!

Cheers,
-- David

--0000000000003c22b705f5900b25
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
64VRg2IjDI2fJVE9RD6aMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQA2lZLYRLu7foeR
cHo1VeNA974FZBiCm08Kd44/aCMEzdTJvxAE9xbUJf7hS1i6eW49qxuSp3/YLn6U7uatwAcmZcwp
Zma19ftf3LH+9Hvffk+X8fbPKe6uHkJhR2LktrhRzF159jj67NvXyGQv8J4n7UNeEVP0d5ByvRwv
tF2bJwlOwRGLoxasKSyDHIyUpwTfWYPq7XvjoGqQ/tDS7Khcc5WncJl0/ZEj7EKjtoGbsDbLdXEF
m/6vdcYKJzF9ghHewtV3YIU4RE3pEM4aCWWRtJwbExzeue6fI7RqURbNCAyQuSpWv0YQvzsX3ZX3
c1otrs50n1N0Sf8/rfJxq7sWMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABxy1wm0tAmHKHFkLS9RWPMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCDQ
3aalqUbG+39zrnaDH2VwfOpzCFFJmKes+jVFif8aGjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzAyMjYwMTExMzZaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEADRFftbwkR7WRok5V4vi1
+/bGrTAxaPe66uQecVpmXER2nS5d6MP/VZ6A1hts/ojQ5iZwLchaaqOHEA/JY2O1Vi4I2Hsr/k2+
DBWMa31W56t1Y+/A3efCFf9gpqC2lUIh0XrjRO0V0Fd2GiEnO7sapRM7MhiHq7pMM9XDRadxZLX+
szsJBj7DRGA+RNlWGkanNutT1jmO0Kzl2K10hE4Nh8hHFC1Y0r3LscevU6jV5hB5b04bOR0a+2rh
ezoO9CUUeDZeursm7Uh4FefmCnl6U+aCYJw80IrNW0z6I15Hzsj/e3n39VJrIiuwAEfNZcF+QpF7
A8qsbaCga1dm54lduw==
--0000000000003c22b705f5900b25--
