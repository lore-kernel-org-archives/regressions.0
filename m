Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F9A7B
	for <regressions@lists.linux.dev>; Sun, 26 Feb 2023 07:31:57 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id a3so6351203vsi.0
        for <regressions@lists.linux.dev>; Sat, 25 Feb 2023 23:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ITS/R4bLuLalFZexDeLas89E5ssNYq7ebdtnmZz69fo=;
        b=h7bkhDrNtquwYscDjZWKMXHnAVM1yljx11j/UbdkWcjCHXd7Fg5zcAT7jVD5QmsMZR
         PYMQqxYEkWUF3HnIMC4HEAsEApm5SpuIdySPpWalxAE/Rmiw7m43dWVCr+tgKVTUyvI1
         hEM+kNrO1ZQrczlDpdmy7XtrbkBKb8m5s8L2ZpLrRzuUA7uDe2qZoEBi0IXLQt9tzH7b
         EorKwKOzuO1BSUrCQON//9ibPr3IcT2oglmOs5xPJVm8Z49jAg5LcWDaQAaTcy4f9tX7
         J+uJf5Z46h0+ZLsKv/3WsZYnL7tcRxv3LGKyx402oFZfemcAevHNuOI8MVgyY+V/evT3
         9uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITS/R4bLuLalFZexDeLas89E5ssNYq7ebdtnmZz69fo=;
        b=Va9UNTdo8iS1JbDPGgoi9c6PSc9cOQE708I4/LGcS/I8A7WONrKH3laOOSOh1OOLdq
         sAJdh5bnCNYfk0Js0Ve2eHHcJRTVgQMbZWuljAXI8GgsK4gdWSqFelZIYSMdl/B2xivM
         kCv1qnft66Th5BrC0n9Wh83w+h1gLRRSFtPZAYJipFl20xC63K8IDjVrihcUQKzgm1jB
         9n8gzhx4P/Uq/n1qFpYSNs3u09VzUUCfvplwwWVL7kULTHa9CFcWJRFLyusyUpfAFOjB
         tlTDUOFs+SPC4KJn+HO0gesH7oOYM44k0/k/psrDYJD1xua7BvLtKDPVq65XEcPDAKq0
         loeA==
X-Gm-Message-State: AO0yUKW5tpAZ3WdjIqEmqHlipryo37nmzcse/sFhMkmnekUZ9A7JEDlR
	vLGgyMsbU7WAN9Zs3ibFwwDme1zvKi4AnmbxjLWhWg==
X-Google-Smtp-Source: AK7set+BxCi/kbivKfeS7a0LI/3BCu14qyiIYuyczxig2cXabDYYfVCEQXrNRzFM/rT4RsgQqKINjhWroPbb4yifXc0=
X-Received: by 2002:a1f:bf4a:0:b0:401:4daf:d581 with SMTP id
 p71-20020a1fbf4a000000b004014dafd581mr5193411vkf.0.1677396715951; Sat, 25 Feb
 2023 23:31:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsO4=qKBF=2FRPVwW8FA4iLFh0Dt9n1BLMec3k10GUorpg@mail.gmail.com>
 <9f682c4d-e7b7-5e23-84f5-cea4fdac2085@leemhuis.info> <CABXGCsNruNKfx3d1dpneRUvn3dCqv_bM93TdJsCLeRYiP3qYaA@mail.gmail.com>
 <6bfa6d67-27ce-04b3-a1f9-3768b8a0169f@leemhuis.info> <CABVgOSnCLbqHHA-gT6FwtJYKYAHt_9uwR_S2r6ZE8hm6eZaLBA@mail.gmail.com>
 <f6616a9e-d250-b808-8c2c-e321e215f622@leemhuis.info>
In-Reply-To: <f6616a9e-d250-b808-8c2c-e321e215f622@leemhuis.info>
From: David Gow <davidgow@google.com>
Date: Sun, 26 Feb 2023 15:31:43 +0800
Message-ID: <CABVgOS=7JMGisPq_QUQpKV1mz8z8D2Esg0TwdMKx23yJhPbQGw@mail.gmail.com>
Subject: Re: [6.3][regression] after commit 7170b7ed6acbde523c5d362c8978c60df4c30f30
 my system stuck in initramfs forever
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, rmoar@google.com, 
	brendanhiggins@google.com, skhan@linuxfoundation.org, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006d04fc05f5955b96"

--0000000000006d04fc05f5955b96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 26 Feb 2023 at 14:02, Thorsten Leemhuis <linux@leemhuis.info> wrote=
:
>
> On 26.02.23 02:11, David Gow wrote:
> > On Sat, 25 Feb 2023 at 23:53, Thorsten Leemhuis <linux@leemhuis.info> w=
rote:
> >> On 25.02.23 15:55, Mikhail Gavrilov wrote:
> >>> On Sat, Feb 25, 2023 at 7:22=E2=80=AFPM Thorsten Leemhuis <linux@leem=
huis.info> wrote:
> >>>>
> >>>> [CCing the regression list, as it should be in the loop for regressi=
ons:
> >>>> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> >>>>
> >>>> On 25.02.23 14:51, Mikhail Gavrilov wrote:
> >>>>> new kernel release cycle returning with new bugs
> >>>>> Today my system got stuck in initramfs environment after updating t=
o
> >>>>> commit d2980d8d826554fa6981d621e569a453787472f8.
> >>>>>
> >>>>> I still do not understand how to configure the network inside the
> >>>>> initramfs environment to grab the logs.
> >>>>> Since an attempt to rebuild the initramfs with all modules (dracut
> >>>>> --no-hostonly --force) leads to the stuck initramfs environment and
> >>>>> impossible entering into initramfs console.
> >>>>
> >>>> Do you see any error messages? I have problems since Friday morning =
as
> >>>> well (stuck in Fedora's initramfs) and see a lot of BPF warnings lik=
e
> >>>> "BPF: invalid name" and "failed to validate module". Was able to do =
a
> >>>> screenshot:
> >>>>
> >>>> https://www.leemhuis.info/files/misc/Screenshot_ktst-f36-x86-64_2023=
-02-24_07:53:14.png
> >>>
> >>> I also seen such messages
> >>> https://freeimage.host/i/img-1475.HMPL26l
> >>
> >> Pretty sure that's the same problem, at least the symptoms match. If
> >> anyone needs a config to reproduce this, here's one of mine that shows
> >> the problem:
> >>
> >> https://www.leemhuis.info/files/misc/config
> >>
> >>> P.S.: I also use Fedora Rawhide.
> >>
> >> Happens for me on all Fedora 36, 37, and 38 (my rawhide build failed f=
or
> >> other reasons, so I couldn't test).
> >
> > Thanks for the report, and sorry this seems to have broken.
> >
> > I've not been able to reproduce this locally yet, but I'm looking into =
it.
> >
> > In the meantime, a few questions if you have time:
> > - Does this happen with CONFIG_KUNIT=3Dy as well as CONFIG_KUNIT=3Dm?
> > - Does this patch fix it?
> > https://lore.kernel.org/linux-kselftest/20230225014529.2259752-1-davidg=
ow@google.com/T/#u
>
> Sorry, limited time and about to leave the house for the day. I only
> could try the latter and did only do a very quick test, but it seems
> that patch fixes the issue for me.
>

Thanks! Glad to hear that patch seems to fix it: we'll try to get it
upstream as soon as possible, then.

I wouldn't worry about testing with CONFIG_KUNIT=3Dy as well at this
point: I doubt it'll shed any more light on the situation.

I've still been unable to reproduce the issue here, even with a fresh
install of Fedora Rawhide, and a very recent torvalds/master:
1ec35eadc3b4 ("Merge tag 'clk-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux")[1].
I even tried plugging in a Keychron C2 keyboard (which also uses
hid_apple), as well as running several KUnit tests which make use of
the hooks functionality: everything worked fine.

Given everything else seems fine here, and the makefile issues fixed
by the above patch both seems to fix this, and is the only real issue
I could imagine having unpredictable behaviour, I'm reasonably happy
to consider this "fixed" by that patch. But if this patch _doesn't_
fix it, or you continue to see some other strange behaviour, we can
look into fixing it further.

Thanks again,

-- David

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3D1ec35eadc3b448c91a6b763371a7073444e95f9d

--0000000000006d04fc05f5955b96
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
MDIwAhABxy1wm0tAmHKHFkLS9RWPMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCDL
/R5DETUoKVm5UeWYT5O0YELB580cxs+bQukGWA15qDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzAyMjYwNzMxNTZaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAABsQNa11yttI+wnc6JOn
jm80XlhJOLHTs2JoCjwB5vJOKlbN+zGcdFdIrO9vquAExcpFoulQO59MHNrXHpO221GRajYWtUSd
/GuB2i9nlmtt4ztR9nw8BtvWnzg5JyfgQwOXzXLTWJqGjyRmXIP+vLmdGg6+fW2DULiw4e15GHp5
AFjFTMa+cLUy8km6Zh5sbKCEhguLbVAtD40TW/Z5Eg2WpEwt1oc5ml4lvbhBnmyoLP57itUbESpW
7QIfDq8tmf7SPtLh//C3MEqv1E2jsrGRWSiljKQhkOhrPJvNvxt8Bmrrp30pAvlp7YkouWtcGXOK
5Xwz2ue6w9BJVoBEZg==
--0000000000006d04fc05f5955b96--
