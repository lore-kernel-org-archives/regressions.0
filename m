Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638BD5208CB
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984765; cv=pass; b=mPfEPBVOuxOz8QzRXHgoFALMPJE8JtMKWKSmuZeH60b0afNR4jSsIDmwK6cUtRh2tCk4kQrKLC7X6yP92er9sdvznVAesNSnzPlrDVw5XFghSl6bS3BqHIC6PZxQsgmbD07p8d5EgPkmvJocr4+B+Lgh77PT9sIDZgbKHayBkxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984765; c=relaxed/simple;
	bh=V7L0U99tvHTcidmbzjPFzdvF7D2gTMvorlFarKDKzI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGxHelkWU1U/w45rfsKJybD6Xgt8yjqsicNPk+ArzC4AeoxJqcZhq55iNOM0hWSA30nEjEgd/bMcOImTtaxvEqfiVVnP6XzgBLGINN3QWFbBIkrQNhUz32hUd1YuDLcoqrYaqr1ABD9nCle1N7+NNJorLUW2BV+Jv7JpsSG0eP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5FdOjmD; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5FdOjmD"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-49de8ea072cso1692867fac.3
        for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 06:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791984755; cv=none;
        d=google.com; s=arc-20260327;
        b=rUxZDZDhAV2e+7hpKn64D3dqVznHYK+7T0RSQLbykAEAqgvTP5NXWI1/8S8yCpij80
         o4MYegNb/x8UMyNKrnpXCSES7As+47MiuX9ar2vT0AnfATbQTxsmC2mqlmHckH98GNSO
         Iwz0MZ5jaZ7J7OgSxRaprcFXZ2W09nIpk4GagSW68gBQZgNf6LaO4/bOmCCpkay1xzj6
         ws086WnbkcCb/GBuEOWb4hPIJECm4t5COHz68mTSlPiLKFkNreXTuV9LbXKZiFTmvdR8
         3/G9fQ/yN3eAGL3xNP+K+XG65yZJI/WtkRNxJyeKVLyLfpBSMlKF3uyF0tIwqtD5Ig9C
         N75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0cq6NAcXfJKAWF6qtJbi/GVl7FMcXFpRqPlXUsw78lA=;
        fh=npD8l7cuwWx1PNUQ/KDOh5AHycfKboHL27q2iXV2wec=;
        b=DG5PVB2gaBuUzDD82tfiWIdoPZz/hif4K2bJ2qer7A2AjeAmqHbw/dJUOE5FyJnkgi
         abO/dNtC0PgfQ8bxmv0R6ADuFlM24HpdHJ3nuxbJeL//Af+5MewzyG16w3vCpPDWkAVy
         pOTeVlRIAPsoiVGVZ/GzyGdNlXudv1z4tv+ONql2WlApu1Lo0V+jiS1Q4ZbEM7H8u4st
         E3BUiWlJP5/vwXwiSmxm4ikwTwds+wWtfEsvc43je6b1Zq9Mag6D7G8gmHTq20JMoCUF
         1O7d8/KyPb0idZhbUwK8kKmupG70KzPN5GQJRN6PIem8j6f7rQQllOBHXkCI1V2MKYds
         7OSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984755; x=1792589555; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0cq6NAcXfJKAWF6qtJbi/GVl7FMcXFpRqPlXUsw78lA=;
        b=J5FdOjmDE6wTE7p9Qriz7jWsn47sr82iQUm9PAA2Zkl5JPrwhHj0UggaSSksuqlctP
         gjtmiW5r+4ooCfJW528ypkiGGpjnIRYF5cRa4i/sKHjxu3L+w+JptGTMJQmg8EmFTaTK
         4+nda8D29c/ueOWRZGHScEebG/rke7qRxAm5Cd2vndqHi8IWZ3sB23311ho5vZ7gbl9i
         c62M6SH93ssuAq0A0Me3Yr0GyB/mzx99oAJQsw7lHaLWASCrWaTTwK8tYEiQ+iX/f8h1
         XaFTbtg/q+s6C55SlroqS5UvvKucAzcm9QDJxszX64CKumIt3GnSivN9jA5zCUP/VWOc
         k+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984755; x=1792589555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cq6NAcXfJKAWF6qtJbi/GVl7FMcXFpRqPlXUsw78lA=;
        b=bmXZqFeEgG0GOS7jtHOgptqQVgSF8r6OhPh3OsX/m5a+G3Kyt4IJsq6DT5hSuI7dep
         COsOz6emQuoKxyFO8tjE3QtHy0jAeiIiSPOed1Mq5MgfaRboHk4ggnT/pYCEStN7eDHw
         9MxNKUUy0joYz5+BVW82At0LGirk6ZXv63DNcViIXJfsJ0Nh1OqavXR4dAi90wNT+lJi
         d6SbA+PHU0ZJ6w+jdALnb8GF0bXumHMW6d7bNSMDl1ulTY7Qtltqlq76Eq47ng24MBnm
         niFXeG0L1NRdME06mytJjwmO3nNfsXH8Ai8ZIaP6xiIlvgPjX6dvGE6js2ldkie/8E8m
         etww==
X-Forwarded-Encrypted: i=1; AKwUvBxvLkWv/gPDYVSQb8v6dPTUgja3QG6UQvDiTRAT3dKL6QTvz4qRE31jIRExE5Umcy8qPNqSTedwXU2nfw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLDREtqEH+1HsctV0KSNi7zefrgAVCdoldShlmFRQ2Hq+9Jp0hS
	46idaVpM9up6ePz1ZrRmBsCc0l9i95DyHhJFdbylvoCnCyXzZ/5tAgQFtod0zvRQDpNe3LiECJp
	0BrbD7LCe9lSQvyKykX5MUOEEu5DKwKo=
X-Gm-Gg: AYBFou0OmYC/ovzrykb5Z7DTkax9PGjs1iheFjjKRBAj6Aq+V/AwHkx9GJGi1kIPdKl
	Tcbk3GhfFWbEuHkk6WUGMTBF+pKK+ly3A8KKX4eFv0/XvZr4NUQ6ywRcYIV0qJHOWiHPM86tRGL
	fUR1HrUNbt3qQWXhGaE2F95UDPjNi07TSA2PGtEuy45gr4raZXleUwi9/xSrf7WrE+44Whv98y5
	+qulvwevfpUMUkdBTcitbuc2W+b/h74nYMPDa7/BYjwWQLv+oYRuL8c1c4Oyuz8Tc7z+O9/U7NA
	gak7/rg8QptzjXKmQIHPjHMawxdpngUD274gdUI+HL/k7tduDnFHZkANsNUmxEhl6OeK19T7Fcp
	CJLbawLSAYFTh
X-Received: by 2002:a05:6870:331f:b0:48f:e24e:6b6c with SMTP id
 586e51a60fabf-4a2a8b580eemr14205687fac.61.1791984754940; Wed, 14 Oct 2026
 06:32:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804142800.4326-1-khomyakovilya@gmail.com> <111e94e9-79c9-48f2-8976-70470e59b89d@leemhuis.info>
In-Reply-To: <111e94e9-79c9-48f2-8976-70470e59b89d@leemhuis.info>
From: =?UTF-8?B?0JjQu9GM0Y8g0KXQvtC80Y/QutC+0LI=?= <khomyakovilya@gmail.com>
Date: Wed, 14 Oct 2026 16:32:23 +0300
X-Gm-Features: AclHuK9k2427IzCFQzfxk5ijt-NQbFahalRCOSjfqEOAYJAuXMNGRteO6GZZ_0o
Message-ID: <CABrBgxdQ1Jn40wR_yEzjxz=BO9YvM530fqTG=F4EvC3m=6RoZQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: mpi3mr: use DevicePage0 link rate only for
 direct-attached targets
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, Ranjan Kumar <ranjan.kumar@broadcom.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>, Kashyap Desai <kashyap.desai@broadcom.com>, 
	Sumit Saxena <sumit.saxena@broadcom.com>, Sreekanth Reddy <sreekanth.reddy@broadcom.com>, 
	mpi3mr-linuxdrv.pdl@broadcom.com, regressions@lists.linux.dev, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.
After sending the email, I didn't receive any response from anyone.

Regards,
Ilya.

=D0=BF=D0=BD, 12 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 18:48, Tho=
rsten Leemhuis <regressions@leemhuis.info>:
>
> On 8/4/26 16:28, Ilya Khomyakov wrote:
> > This patch fixes a regression in the Broadcom MPI3 Storage Controller
> > driver under drivers/scsi/mpi3mr/.
>
> Ilya, what's the status of this regression fix? It looks like it fall
> through the cracks. Or was there some progress that I missed (which can
> easily happen!)
>
> Ciao, Thorsten
> > Commit c273c14b0294 ("scsi: mpi3mr: Use negotiated link rate from
> > DevicePage0") changed mpi3mr to prefer the cached DevicePage0 rate.
> >
> > DevicePage0 stores negotiated_link_rate as one standalone MPI3 SAS
> > link-rate code, while SAS PHY Page 0 and SAS Expander Page 1 store logi=
cal
> > and physical rates as two nibbles of one packed byte.
> >
> > mpi3mr_get_sas_negotiated_logical_linkrate() currently sends both forma=
ts
> > through the same high-nibble extraction at its common exit. A valid
> > DevicePage0 value of 0x0b or 0x0c is therefore converted to zero. The l=
ater
> > minimum-rate safeguard then publishes the value as 1.5 Gbit/s.
> >
> > For example:
> >
> >   DevicePage0 value:            0x0b
> >   packed-field extraction:      (0x0b & 0xf0) >> 4 =3D 0x00
> >   minimum-rate substitution:    0x00 -> 0x08
> >   Linux SAS transport result:   1.5 Gbit/s
> >
> > There is also a topology distinction. The caller uses the returned valu=
e to
> > update the parent sas_phy. In an expander topology with the HBA-to-expa=
nder
> > link limited to 12 Gbit/s, DevicePage0 reported 0x0b for every tested
> > target, while Expander Page 1 reported 0xcc for several disk-facing PHY=
s
> > that were operating at 22.5 Gbit/s. The cached target value therefore
> > cannot unconditionally replace the local parent expander PHY value.
> >
> > The original failure was reproduced on an eHBA 9600 controller with a
> > SAS4016 IOC and a 46-PHY Microchip expander. Before the fix, a target w=
ith
> > DevicePage0 negotiated_link_rate 0x0b could remain visible in sysfs as
> > 1.5 Gbit/s when a replayed topology event contained current=3D0x0b and
> > previous=3D0x0b and therefore skipped the Linux-side update.
> >
> > Validate the standalone DevicePage0 code and use it directly only for a
> > directly attached target. For an expander-attached target, retain the
> > existing Expander Page 1 path because it describes the local parent
> > expander PHY being updated. Retain the SAS PHY Page 0 fallback when a
> > directly attached cached value is invalid.
> >
> > The topology-aware variant was tested in an out-of-tree mpi3mr 8.17.1.0=
.
> > build. After boot, Linux reported:
> >
> >   PHY 18: 12.0 Gbit/s
> >   PHY 19: 12.0 Gbit/s
> >   PHY 24: 22.5 Gbit/s
> >   PHY 25: 22.5 Gbit/s
> >   PHY 26: 22.5 Gbit/s
> >   PHY 27: 22.5 Gbit/s
> >   PHY 28: 12.0 Gbit/s
> >   PHY 30: 22.5 Gbit/s
> >
> > No tested PHY was incorrectly reported as 1.5 Gbit/s, and the 22.5 Gbit=
/s
> > disk-facing rates were preserved even though DevicePage0 contained 0x0b=
.
> >
> > Fixes: c273c14b0294 ("scsi: mpi3mr: Use negotiated link rate from Devic=
ePage0")
> > Signed-off-by: Ilya Khomyakov <khomyakovilya@gmail.com>
> >
> > ---
> >  drivers/scsi/mpi3mr/mpi3mr_transport.c | 46 ++++++++++++++++++++++----
> >  1 file changed, 39 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_transport.c b/drivers/scsi/mpi3=
mr/mpi3mr_transport.c
> > index 240f67a..740fccc 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_transport.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c
> > @@ -587,6 +587,30 @@ static enum sas_linkrate mpi3mr_convert_phy_link_r=
ate(u8 link_rate)
> >       return rc;
> >  }
> >
> > +/**
> > + * mpi3mr_sas_link_rate_valid - validate a standalone SAS link-rate co=
de
> > + * @link_rate: MPI3 standalone SAS negotiated link-rate code
> > + *
> > + * DevicePage0 stores one plain negotiated link-rate code. Accept only
> > + * negotiated data rates supported by the SAS transport conversion cod=
e;
> > + * reserved or transitional values must use the existing PHY-page path=
.
> > + *
> > + * Return: true for a supported negotiated data rate, false otherwise.
> > + */
> > +static bool mpi3mr_sas_link_rate_valid(u8 link_rate)
> > +{
> > +     switch (link_rate) {
> > +     case MPI3_SAS_NEG_LINK_RATE_1_5:
> > +     case MPI3_SAS_NEG_LINK_RATE_3_0:
> > +     case MPI3_SAS_NEG_LINK_RATE_6_0:
> > +     case MPI3_SAS_NEG_LINK_RATE_12_0:
> > +     case MPI3_SAS_NEG_LINK_RATE_22_5:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> >  /**
> >   * mpi3mr_delete_sas_phy - Remove a single phy from port
> >   * @mrioc: Adapter instance reference
> > @@ -2292,18 +2316,26 @@ void mpi3mr_expander_remove(struct mpi3mr_ioc *=
mrioc, u64 sas_address,
> >  static u8 mpi3mr_get_sas_negotiated_logical_linkrate(struct mpi3mr_ioc=
 *mrioc,
> >       struct mpi3mr_tgt_dev *tgtdev)
> >  {
> > -     u8 link_rate =3D MPI3_SAS_NEG_LINK_RATE_1_5, phy_number;
> > +     u8 cached_link_rate, link_rate =3D MPI3_SAS_NEG_LINK_RATE_1_5;
> > +     u8 phy_number;
> >       struct mpi3_sas_expander_page1 expander_pg1;
> >       struct mpi3_sas_phy_page0 phy_pg0;
> >       u32 phynum_handle;
> >       u16 ioc_status;
> >
> > -     /* First, try to use link rate from DevicePage0 (populated by fir=
mware) */
> > -     if (tgtdev->dev_spec.sas_sata_inf.negotiated_link_rate >=3D
> > -         MPI3_SAS_NEG_LINK_RATE_1_5) {
> > -             link_rate =3D tgtdev->dev_spec.sas_sata_inf.negotiated_li=
nk_rate;
> > -             goto out;
> > -     }
> > +     cached_link_rate =3D
> > +             tgtdev->dev_spec.sas_sata_inf.negotiated_link_rate;
> > +
> > +     /*
> > +      * For a directly attached target, DevicePage0 and the parent hos=
t PHY
> > +      * describe the same link, so the standalone cached code can be u=
sed
> > +      * without packed-field decoding. For an expander-attached target=
, the
> > +      * caller updates the parent expander PHY and DevicePage0 can dif=
fer from
> > +      * that local segment; retain the Expander Page 1 read in that ca=
se.
> > +      */
> > +     if ((tgtdev->devpg0_flag & MPI3_DEVICE0_FLAGS_ATT_METHOD_DIR_ATTA=
CHED) &&
> > +         mpi3mr_sas_link_rate_valid(cached_link_rate))
> > +             return cached_link_rate;
> >
> >       /* Fallback to reading from phy pages if DevicePage0 value not av=
ailable */
> >       phy_number =3D tgtdev->dev_spec.sas_sata_inf.phy_id;
>
