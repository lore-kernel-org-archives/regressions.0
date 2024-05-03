Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519DF50A9D
	for <regressions@lists.linux.dev>; Fri,  3 May 2024 21:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714771553; cv=none; b=IPd2o5f/oGX0lWALqL7Z57nbN2fyQE1vIBzS75+2N5xYTtUw/lyzJLrn7hsPfTj+vRTgowYri3OQmA0/JAnmDG9Au9xX634uCSqc8yurLD0TVlTwoARCe2oQ24RDltjy0OwuXq6NhVHqySvvfZ01F1eKywhk9b/lLPrxTw5ejO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714771553; c=relaxed/simple;
	bh=WXWeP4ev853dPKexyhkyVzoZ012ZID3voS2FDqNJ3N4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxJ/8clZLH04y3ov3OY1ZlY0EwTCM+VIBFaxHvgfP+4hzVCPGo4DYwGlzFP5z4wjrEuG3tAzS+KqJ9SVZhUupAap7Nht4G+qU94goipOASMIGbfD+t7mnncKKKexCZiUOwy7CzBy7GGfFheYXf7BUyuOJARI8J7QFXjOGQ7Tz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7+X0IT2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7+X0IT2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2b433dd2566so107995a91.2
        for <regressions@lists.linux.dev>; Fri, 03 May 2024 14:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714771551; x=1715376351; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGCAEBsx5sU0GBNY/c0fxAm283aZKfn55STI4WKiXnk=;
        b=I7+X0IT2edVRkjJoBSWe4T/aBe8OIuSN7VWYi1FLEFE9EyZBWT8iDlNN1SYixV11G0
         fbYcYtG+wHJdftbMMLy/GckRm8mJtk6GSNJwZy07r51D7dChBY2stLh2f9Qmuun/VzPI
         dagiaJwjwxn71WCBiG8sagNmAjCWiSRa04Tkyzhtu4afVPqx7pORnGjGI3T44KIgVJJg
         o5U1M0ImkuTMJC733y3ERwOGKhcph6Z2mXj6kYjmDsKcf39PNXfARii4BuPE1l1L8m1V
         x2CP5bPfsVx9Q+AaXxTNO6vCbPRiuL3esypRrvas93YYE98ADuvyLDAEX3OAyH+P7lau
         8eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714771551; x=1715376351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGCAEBsx5sU0GBNY/c0fxAm283aZKfn55STI4WKiXnk=;
        b=DPjPXm+01lzKoegzdDKyvEHcrxQ9Pks1KeyUvaXNCi0v5/pbgdomeDNh+EtbDGfTMO
         cLTPR2mrmlgfXdDye9LURZ7c9DTDl0sLAwrqmiVapm1nYs83eKpRTSvs4glvxmcxXV9r
         bk77IUPFmNLotpwgMs4wZqCfAS/U49jNfIm+b38EvF6ksx4Arm/OjIFM08ovMxkPJPVo
         Feid1KQu34vKwovSkaPOkRMmwh5rBluOkJxeuJKtFnuLzBC7vIddEkyEE05mnSxw4FXG
         xXo9sZ7sCkHtAFNjtCA7TsHK128fIlWSCeqxiVItHreqmF9BDrB5tyJTRTn4I3nx9004
         2/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP3uRdDLcEH0Il6gXWD47QoWmhkjseKrjYsI7BFplvF4/EIHoMiF68e2NqCOCDxObL4y2ee6GkZwVpsmDllFuzp0Bll+riKwfokh0=
X-Gm-Message-State: AOJu0YxnrJ0cL14HUyjkgtmCZ2/FKNUgqIheFcU6kylw/FvxSR/cEL7B
	7jUQEgROYQs6leUPaNmupHZUDMFLqJ4DurTTfP54IeDaxxFzWApTGXVSm+isS3lSvOSZfD6nMqn
	RnF1RpAUWd49EjM8QZSPVgivPJz0=
X-Google-Smtp-Source: AGHT+IG6GFpeVnbtIbUiMOsU/jaXewm8efNjRxPYXu++O7uoi9t6Qv3dQcR3z5GKeSiZrZ8ukt+lmp0FjRRDUU7QRJg=
X-Received: by 2002:a17:90b:1992:b0:2a0:215f:dc9c with SMTP id
 mv18-20020a17090b199200b002a0215fdc9cmr3948824pjb.35.1714771551417; Fri, 03
 May 2024 14:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1714658761-15326-1-git-send-email-quic_zijuhu@quicinc.com>
 <CABBYNZJc=Pzt02f0L3KOSLqkJ+2SwO=OZibA=0S0T3vKPDwPyw@mail.gmail.com> <c5998fbd-bd63-4f7d-8f51-3dd081913449@quicinc.com>
In-Reply-To: <c5998fbd-bd63-4f7d-8f51-3dd081913449@quicinc.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 3 May 2024 17:25:36 -0400
Message-ID: <CABBYNZJOVnBShpgbWEpFBcu_MnHW+TKLndLKnZkkB9C71EfJNA@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: qca: Fix BT enable failure again for
 QCA6390 after warm reboot
To: quic_zijuhu <quic_zijuhu@quicinc.com>
Cc: luiz.von.dentz@intel.com, marcel@holtmann.org, 
	linux-bluetooth@vger.kernel.org, wt@penguintechs.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 3, 2024 at 4:18=E2=80=AFPM quic_zijuhu <quic_zijuhu@quicinc.com=
> wrote:
>
> On 5/4/2024 3:22 AM, Luiz Augusto von Dentz wrote:
> > Hi Zijun,
> >
> > On Thu, May 2, 2024 at 10:06=E2=80=AFAM Zijun Hu <quic_zijuhu@quicinc.c=
om> wrote:
> >>
> >> Commit 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on close=
d
> >> serdev") will cause below regression issue:
> >>
> >> BT can't be enabled after below steps:
> >> cold boot -> enable BT -> disable BT -> warm reboot -> BT enable failu=
re
> >> if property enable-gpios is not configured within DT|ACPI for QCA6390.
> >>
> >> The commit is to fix a use-after-free issue within qca_serdev_shutdown=
()
> >> during reboot, but also introduces this regression issue regarding abo=
ve
> >> steps since the VSC is not sent to reset controller during warm reboot=
.
> >>
> >> Fixed by sending the VSC to reset controller within qca_serdev_shutdow=
n()
> >> once BT was ever enabled, and the use-after-free issue is also be fixe=
d
> >> by this change since serdev is still opened when send to serdev.
> >>
> >> Fixes: 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on close=
d serdev")
> >> Cc: stable@vger.kernel.org
> >> Reported-by: Wren Turkal <wt@penguintechs.org>
> >> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218726
> >> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> >> Tested-by: Wren Turkal <wt@penguintechs.org>
> >> ---
> >>  drivers/bluetooth/hci_qca.c | 5 ++---
> >>  1 file changed, 2 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> >> index 0c9c9ee56592..8e35c9091486 100644
> >> --- a/drivers/bluetooth/hci_qca.c
> >> +++ b/drivers/bluetooth/hci_qca.c
> >> @@ -2450,13 +2450,12 @@ static void qca_serdev_shutdown(struct device =
*dev)
> >>         struct qca_serdev *qcadev =3D serdev_device_get_drvdata(serdev=
);
> >>         struct hci_uart *hu =3D &qcadev->serdev_hu;
> >>         struct hci_dev *hdev =3D hu->hdev;
> >> -       struct qca_data *qca =3D hu->priv;
> >>         const u8 ibs_wake_cmd[] =3D { 0xFD };
> >>         const u8 edl_reset_soc_cmd[] =3D { 0x01, 0x00, 0xFC, 0x01, 0x0=
5 };
> >>
> >>         if (qcadev->btsoc_type =3D=3D QCA_QCA6390) {
> >> -               if (test_bit(QCA_BT_OFF, &qca->flags) ||
> >> -                   !test_bit(HCI_RUNNING, &hdev->flags))
> >
> > This probably deserves a comment on why you end up with
> > HCI_QUIRK_NON_PERSISTENT_SETUP and HCI_SETUP flags here, also why you
> > are removing the flags above since that was introduce to prevent
> > use-after-free this sort of revert it so I do wonder how serdev can
> > still be open if you haven't tested for QCA_BT_OFF for example?
> >
> okay, let me give comments at next version.
> this design logic is shown below. you maybe review it.
>
> if HCI_QUIRK_NON_PERSISTENT_SETUP is set, it means that hdev->setup()
> is able to be invoked by every open() to initializate SoC without any
> help. so we don't need to send the VSC to reset SoC into initial and
> clean state for the next hdev->setup() call success.
>
> otherwise, namely, HCI_QUIRK_NON_PERSISTENT_SETUP is not set.
>
> if HCI_SETUP is set, it means hdev->setup() was never be invoked, so the
> SOC is already in the initial and clean state, so we also don't need to
> send the VSC to reset SOC.
>
> otherwise, we need to send the VSC to reset Soc into a initial and clean
> state for hdev->setup() call success after "warm reboot -> enable BT"
>
> for the case commit message cares about, the only factor which decide to
> send the VSC is that SoC is a initial and clean state or not after warm
> reboot, any other factors are irrelevant to this decision.
>
> why the serdev is still open after go through
> (test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)
> || hci_dev_test_flag(hdev, HCI_SETUP) checking is that
> serdev is not closed by hci_uart_close().

Sounds like a logical jump to me, in fact hci_uart_close doesn't
really change any of those flags, beside these flags are not really
meant to tell the driver if serdev_device_close has been called or not
which seems to be the intention with HCI_UART_PROTO_READY so how about
we use that instead?

Another thing that is troubling me is that having traffic on shutdown
is not common, specially if you are going to reboot, etc, and even if
it doesn't get power cycle why don't you reset on probe rather than
shutdown? That way we don't have to depend on what has been done in a
previous boot, which can really become a problem in case of multi-OS
where you have another system that may not be doing what you expect.

> see hci_uart_close() within drivers/bluetooth/hci_serdev.c
> static int hci_uart_close(struct hci_dev *hdev)
> {
> ......
>         /* When QUIRK HCI_QUIRK_NON_PERSISTENT_SETUP is set by driver,
>          * BT SOC is completely powered OFF during BT OFF, holding port
>          * open may drain the battery.
>          */
>         if (test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>                 clear_bit(HCI_UART_PROTO_READY, &hu->flags);
>                 serdev_device_close(hu->serdev);
>         }
>
>         return 0;
> }
>
> >> +               if (test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->qu=
irks) ||
> >> +                   hci_dev_test_flag(hdev, HCI_SETUP))
> >>                         return;
> >>
> >>                 serdev_device_write_flush(serdev);
> >> --
> >> 2.7.4
> >>
> >
> >
>


--=20
Luiz Augusto von Dentz
