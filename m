Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD1B153BE9
	for <regressions@lists.linux.dev>; Sat, 26 Sep 2026 11:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790422669; cv=pass; b=F1fEKJ4Au2ALD7yDY2JBt+Vq8Lp43q8datXXAO3WQ+RvJW8/ljpZ+qs1PRGoLumAJy8gJjMVYIvBRaIxkAcfyaYcMdiHpQaJ485ccBjusF1T+Z//JjhieUrPiQ3IlnIKJdXNidW0YQ5DMQwOjCIdCY6quEO7+1aaFXZ0JNFkSCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790422669; c=relaxed/simple;
	bh=68Wiv8wHJvbEk9mrCiLB3bM+Opz4jkFUN+0XWuQEkho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4/byT/DB5KyMVR5F3l+phJjGXEhaRgnhvZD17d1ifW+U3hDmv3nLtU+2rZ3LJ2E5md3X+3uZoYjSizTCx2DvfI1F3XhS+n04aMC4X3ZFiNrGhcc6kBmff964E+eKHOtaSAeTgqkUnmp9LwyYv6670mobPgPgTtYaOZUzJnDW5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXBeLWvF; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXBeLWvF"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6714595153cso1494336d50.0
        for <regressions@lists.linux.dev>; Sat, 26 Sep 2026 04:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790422664; cv=none;
        d=google.com; s=arc-20260327;
        b=SN3jS76VFAkRFyPjBmPDwbHRYiXAxHo9vmYAJ1P16aKRq43lj1rQRyRjmg+GXInbZZ
         /uKGCBPkTzJlrIg0IgRCp2bH25zLuwpqllnAkvRhQ7/15Fs8XDQukaL35qrQq2osVlgA
         Nnz43aSxGjbTIY5u5SSXECBViohmpw07obBrlq8E/NCm6UgGuImoxbArCTSrxAeeFsYD
         v62yN1EbQn1e2xkaR9keHv+CDs1kkx9fKIJIhLbngxmIjQbaJjVbc5ca3ix2CeuCDP62
         XNgrJnWH2WqlLC0zrrp6oKX5h5+iFTF1/3midVE2k7gvhzXZIe0baz5ZdVLLmKncT865
         tcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QvggGhnupRLIEIkKlMrtsgz2RGgPlCZnn86Nk5jPwh0=;
        fh=Dbgj3hIzWMQiw/XI2TFmGPPQiQaBNP8CciZg+8UjD7s=;
        b=qy94g5Ef5cXdAx0a+LGL3iRputjzRhB8DNkjsqOtAamfX2P4f6IGfSLtdMl1r+yqPR
         HjcmmBtCBv8Uib4iubGK6WUcSLWYzrlBf2Goi5N0t01bE6mLf4bVmo6c1eZ9JoCkqYde
         V2TEeOs0mKdspAcuORjoXvIKNekY1RxI6DIyECtX1iEBjKc/Hbyn9v3ueBdcD2K+8Mc1
         citvh2vcb7MTM5sBOUGp+GNbPraQ2iVAy6yRLmW3KHBdy/fvJV8MiZUhYdYpQN1jBChe
         qydHxaMYqROMPm2/E8YV5aUzCV1+Kk6RyHtRsLLIMXl9UTIKlbP+T+ODwaC5uGTb+8fr
         LCkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790422664; x=1791027464; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QvggGhnupRLIEIkKlMrtsgz2RGgPlCZnn86Nk5jPwh0=;
        b=AXBeLWvFt8qeE8/W4kjXVhGou6z019+H/JnpTS4qdMoD5KZ0FU+2e5iSa72snSWj/2
         m4XRfnxk3FnTqqKbEcjcvDPudLjH3wnFYBV8CryNurecJQ4GphAInvhDJM+VaU64WOXj
         QIcd3Fz3s+B9BRR4l+Vv/ND5bAi4eAkA+fw0Wd5eGQYBJRNSIQfEgBr8f0LkUocPXqIV
         LKLqaPTGA605epoytCH8JMsylV7QlAVoY/M3SFuRliPWtya9lskvQnoWskRBdxwzC98l
         iS/er33vlloQoY3eBDlrZKH/WbYIsik96sefW9Zu3GhHzgFQYh1ui4g0m93pz+N4rNUw
         jEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790422664; x=1791027464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QvggGhnupRLIEIkKlMrtsgz2RGgPlCZnn86Nk5jPwh0=;
        b=2YqLljmglYMgxYkrb38Kky9n2CXNhC0afzkcttxaQETtZa+fztWd1R1W3tMuCVHrwM
         lGKqvi2SqIYJWp/3FiXjTd8YiIV7vb8ZI0PSUFzf9/ODLwUAnralejfJpB2deO/bSbnh
         NYhgl90gNkVpivx8uAOmKXXIHiaV57hox5cmCx3EwPSDzmpN0kfdCNZteryHhYUQt7Sr
         r0a5P+TbkEjvEW7weGxMieh8v97oKcWd2rotwF05+2kCtzzuiYmb34QK2RDhZ0FF1J9L
         vJyCUjA2//ZGMDuk1Rg2acnffmfJGzj3zkCrmAZzkLWfmNmWC8AuNO6r4Ejtv1xQbVX7
         E0gQ==
X-Gm-Message-State: AFq9FYL/1EK2pxC6lCC33Xlz6W4gT8JK32JRStMlNgDi9lGAr494mbx6
	k1OrfG16vycnEk/C90xzJJa+CUy+91bbZ7apaupf/zvfz95KHAQ15w3Tc2Zh2VciayKk/F7JcDR
	GtEPNf4pisoNpsa1v0d1Cbs84BzJYoTI=
X-Gm-Gg: AYBFou24bXNwtkYpj6Dux0GCGpb6OG77ijOBPAMNjLF+zjiy7tSc+jurgjTY5d1odRj
	Tl67WQM4Lwj/YASI6WS2sSdo49qwlx1fRTszNY7iK0te/8hiB3sQSZFRiWhGp4p/XL4HBAn9ZR2
	95ysx6naEDu2FpRiX8jZMkHyvcQg6tvMtf/orj9KI0tMCdR9q1Qid3RtQK1vLlpK29PWcMHbAKM
	Zoo+cBlmEntgOqgCNbEeHze8574TVzVBOwgIJxc+ycgk40OSlpAyAWM/K2Fk3ObHDbKy1/50llr
	kziQEsZGOD/Mt3UMM/dMXOUpigNMuATYcrRwHwjyD7Ivg9fSR3X9A5j8oEvo/hoXW2FUkA4f2hm
	62yJYA2o0WjoC6z9r5COwf9Kjb+tbHpDYgX4HiruSP7HbjHnBN/n8MijrvwTcVT3gJLR0gF1Y8v
	87fpAaiZV4+Veldn9PiQFERtsS7QdiyvnwvOrwfUrFYZ1mwFt2SGI=
X-Received: by 2002:a05:690e:118a:b0:672:c99f:5f5a with SMTP id
 956f58d0204a3-672ed21a28amr3849007d50.8.1790422664082; Sat, 26 Sep 2026
 04:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAE4bxw+ofDFVx0aTHqCrzns9oP1CRQDm_wzeyHPeMBYOhSpcuA@mail.gmail.com>
 <f322a3b2-71eb-45e7-aeaf-18ad87f938ce@leemhuis.info> <4f28488c-ff9e-46db-aa2a-687213c129d6@leemhuis.info>
In-Reply-To: <4f28488c-ff9e-46db-aa2a-687213c129d6@leemhuis.info>
From: Andy Tsvetinskiy <andrew.tsvetinskiy@gmail.com>
Date: Sat, 26 Sep 2026 14:37:15 +0300
X-Gm-Features: AclHuK-LM3582XP4q5xJzcz82yrDpld4vWvmDeYDwN8GMT1tFWaBbiulwNqUc7c
Message-ID: <CAE4bxwJEPJ26LMPstWkE26pxuC+CpM7y_0odYCdp1i=3XA=H9g@mail.gmail.com>
Subject: Re: [REGRESSION] RTL8761BU 0bda:a728: removing BROKEN_EXT_SCAN fixes
 0x200c timeout
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: regressions@lists.linux.dev, linux-bluetooth@vger.kernel.org, 
	Kamil Serwus <kserwus@gmail.com>, Junjie Cao <junjie.cao@intel.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	LKML <linux-kernel@vger.kernel.org>, Alexej Sidorenko <alexej@sidorenko.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

7.3-rc4 checked, issue still exists

=D0=BF=D1=82, 25 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 12:0=
5, Thorsten Leemhuis <regressions@leemhuis.info>:
>
> On 9/18/26 15:37, Thorsten Leemhuis wrote:
> > Lo!
> > On 9/18/26 11:21, Andy Tsvetinskiy wrote:
> >>
> >>    This report concerns USB ID 0bda:a728, not 0bda:8771.
> >>
> >>    I have a Realtek RTL8761BUV USB Bluetooth adapter:
> >>
> >>    - USB ID: 0bda:a728
> >>    - Product: Bluetooth 5.4 Radio
> >>    - Firmware: rtl_bt/rtl8761bu_fw.bin
> >>    - Firmware version: 0xdfc6d922
> >>    - Running kernel: 6.18.51-1-lts
> >>    - Distribution: Arch Linux
> >>
> >>    With the stock btusb driver, Bluetooth repeatedly failed with:
> >>
> >>        Bluetooth: hci0: command 0x200c tx timeout
> >>        Bluetooth: hci0: Opcode 0x200c failed: -110
> >>        Bluetooth: hci0: Unable to disable scanning: -110
> >>        Bluetooth: hci0: Resetting usb device.
> >>        usb 1-2.2: reset full-speed USB device
> >>        Bluetooth: hci0: unexpected event for opcode 0x200c
> >
> > Thx for the report. Just replying to bring a few people into the loop
> > that can help handling this: the Blutooth maintainers and developers
> > which were involved in ca0583c2466174 ("Bluetooth: btusb: limit RTL8761=
B
> > BROKEN_EXT_SCAN quirk to 0bda:a728") [v7.3-rc1] and 5ead2063611ae5
> > ("Bluetooth: btrtl: fix RTL8761B/BU broken LE extended scan")
> > [v7.2-rc1]. Ciao, Thorsten
>
> Hmm, seems nobody cares, so we need to go the next step: can you please
> test if latest mainline (7.3-rc4 or later) is affected to rule out that
> it's something specific to the stable series in question?
>
> Ciao, Thorsten
> >>    The firmware was loaded successfully:
> >>
> >>        Bluetooth: hci0: RTL: loading rtl_bt/rtl8761bu_fw.bin
> >>        Bluetooth: hci0: RTL: loading rtl_bt/rtl8761bu_config.bin
> >>        Bluetooth: hci0: RTL: fw version 0xdfc6d922
> >>
> >>    The USB autosuspend setting was not the cause:
> >>
> >>        /sys/bus/usb/devices/1-2.2/power/autosuspend: -1
> >>
> >>    The current upstream fix ca0583c24661
> >>    ("Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCAN quirk to 0bda:a7=
28")
> >>    is already present in my kernel. It sets BTUSB_BROKEN_EXT_SCAN for =
0bda:a728.
> >>
> >>    I tested the opposite change locally in drivers/bluetooth/btusb.c:
> >>
> >>        - { USB_DEVICE(0x0bda, 0xa728), .driver_info =3D BTUSB_REALTEK =
|
> >>        -                    BTUSB_BROKEN_EXT_SCAN },
> >>        + { USB_DEVICE(0x0bda, 0xa728), .driver_info =3D BTUSB_REALTEK =
},
> >>
> >>    After rebuilding and reloading the btusb module:
> >>
> >>        systemctl stop bluetooth
> >>        modprobe -r btusb
> >>        modprobe btusb
> >>        systemctl start bluetooth
> >>
> >>    Bluetooth scanning worked normally. A 20-second scan completed with=
:
> >>
> >>        Discovery started
> >>        Discovering: yes
> >>
> >>    After loading the patched module, no new occurrences of the
> >> following messages appeared:
> >>
> >>        Opcode 0x200c failed: -110
> >>        Opcode 0x2042 failed
> >>        command tx timeout
> >>        Unable to disable scanning
> >>        Resetting usb device
> >>
> >>    The patched driver is currently loaded and Bluetooth remains operat=
ional.
> >>
> >>    This suggests that different RTL8761BUV devices or firmware
> >> revisions using USB ID 0bda:a728 may require different scan quirks. On
> >> my device, keeping BTUSB_BROKEN_EXT_SCAN causes the legacy 0x200c
> >> command to
> >>  time out, while removing the quirk fixes the issue.
> >>
> >>    Relevant upstream reports:
> >>
> >>    https://linux-regtracking.leemhuis.info/regzbot/regression/lore/202=
60822141115.58815-1-kserwus@gmail.com/
> >>
> >>    https://bugzilla.redhat.com/show_bug.cgi?id=3D2521504
> >>
> >>    https://lkml.iu.edu/2608.2/12212.html
> >>
> >>    Please let me know if more logs, a full patch, or additional
> >> testing is needed.
> >>
> >
>


--=20
-- follow your dream...
