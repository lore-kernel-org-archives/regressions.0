Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ECA2EAE1
	for <regressions@lists.linux.dev>; Thu, 26 Oct 2023 23:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZ/RrlTB"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9be3b66f254so210405966b.3
        for <regressions@lists.linux.dev>; Thu, 26 Oct 2023 16:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698361601; x=1698966401; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1lvafxgrPH4MslhVVJ8PWeokuJA7ysCGpjbxciD6xM=;
        b=TZ/RrlTB6NitVqk4wGSZ2mHP4uoRs+ipVfp3TeCz8n/8DKjaKwjISstzPve0ok54Md
         jgTUuF/XqZDfAvETMGEt+DIBIPAJfG9GpEE49wZ8ef1RPnsBdrC+Bk86t4RqZHOQDvOK
         n3Yb5BOfbbdCA4D58aCRqsO4lI55zYT2AHNIVQmalmnGbgIinhnBLflhWtOgzo/vmoKa
         dbz++fIPSLjATN7bZL2Fi3kzcs0O531Y7nm+zgkdoEERCRdFXX3WrPE67nuVNqK7K8yg
         hPWTKAQQbm86ELu25v7aQOyISu+ujARGdtD0d14fvuUolMudgL52HHBqifzoW7fYbrut
         C9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698361601; x=1698966401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1lvafxgrPH4MslhVVJ8PWeokuJA7ysCGpjbxciD6xM=;
        b=fUjCzLiRaEZkjOpf5vDBmZVEd8bX7UjmhndojNs67h5x1vey/zpXcbxqmhJ/2bZQnz
         aDS4zDw20W7QkT97QZ1JQM8b+CHDLV7RLaXEs3JAeMLQ3AiF5SZhkKd0uYomBxFaz9un
         Adq2Wu4VrEmPf5nELvIiKin+QJowAWZFfQULq0rl32ts0mrTx2z8GVRhgltZTrlG74xV
         JDewJ5sF//EvUPdMLFDELQJw6TKCX+nJkKP6sL5mUmztOCbroo/djnzaAR8unnivfk1D
         WGBYrsIZYGgolANH8pyBXCM8I1Wqw5rJaXac3vlMWC+RICIW2M9sfqOrseJ4ExBjTZIl
         KM4A==
X-Gm-Message-State: AOJu0YxEkVBWZKrl4gCe9infHcAkx7ut0V4kSc9cJUeeHc+Zt8RDXBvh
	Do4HrpKo4wGOSxwS9CRfEWz1OMpR8+0B9FWU3Vg=
X-Google-Smtp-Source: AGHT+IGxmHbbMVWBC/bICXPWqiak9mqMZ+cfACESgbJx35V7lt5rWdCzi2NT9XuSrO2RdKAwoa9UzoocTNcZXwV4X6s=
X-Received: by 2002:a17:906:fd8b:b0:9bf:30e8:5bfd with SMTP id
 xa11-20020a170906fd8b00b009bf30e85bfdmr892154ejb.48.1698361601374; Thu, 26
 Oct 2023 16:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1326a6e4-758d-3344-d90c-8a126748b034@gmail.com>
 <6a0c3aa0-86a8-8c06-81df-2d7085946cf5@leemhuis.info> <16885654-09f0-c139-cc9b-c6c4d666932e@quicinc.com>
 <ae1ad814-5613-704e-b0b1-4f1fc4bead44@leemhuis.info> <1945f748-fb71-f1c1-83a2-ba0470daf817@quicinc.com>
 <ZPUXMx0H/8U9j15F@luigi.stachecki.net> <1ba68ccb-9faa-8f9f-64cb-cf74dc0a2184@quicinc.com>
In-Reply-To: <1ba68ccb-9faa-8f9f-64cb-cf74dc0a2184@quicinc.com>
From: Tyler Stachecki <stachecki.tyler@gmail.com>
Date: Thu, 26 Oct 2023 19:06:49 -0400
Message-ID: <CAC6wqPUFkXqT5t2jQxtDPfUtjUVLkKyzWawwDOxW7h_74PxhZQ@mail.gmail.com>
Subject: Re: Fwd: ath11k: QCN9074: ce desc not available for wmi command
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Kalle Valo <quic_kvalo@quicinc.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Jakub Kicinski <kuba@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Atheros 11K <ath11k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 4, 2023 at 5:47=E2=80=AFAM Manikanta Pubbisetty
<quic_mpubbise@quicinc.com> wrote:
> > Hi Manikanta,
> >
> > I just wanted to report that this is likely related to QCN9074 when the=
 host
> > system only has 1 MSI-X vector available for the modem and/or related t=
o a
> > product named "WPEQ-405AX".
> >
> > I have two different hosts running the exact same kernel, same QCN9074
> > firmware (WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1), etc. The only
> > differences are that the one which does not work is running on a slight=
ly
> > older Intel SBC, with the older one leveraging mPCIe instead of PCIe an=
d
> > only having one MSI-X vector.
>
> Yes, you are right. This seems to be a problem with some hardware having
> QCN9074. We have tried to reproduce this problem in QC on different
> hardware but could not reproduce it even once. Not even with one MSI vect=
or.

Just as a heads up, this "Sparklan WPEQ-405AX" version of QCN9074 may
be adding to some of the confusion here and so there may be two
problems. As mentioned previously, CE desc errors stopped after
reverting the threaded NAPI patch. However, there's something odd
about this modem - it does not work with the board-2.bin that Kalle
provides as the OP noted.

Upon request, the vendor of this modem provides a board.bin for
WPEQ-405AX compatible with a copy of amss/m3 which appears to be
WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1 (based on checksums). I
found out the hard way that the ABI of the BDFs changed for
WLAN.HK.2.5.0 firmwares and beyond, making things non-backwards
compatible with the board.bin that the vendor provides.. which is
unfortunate as the vendor would not supply a BDF built against 2.5.0+
when requested.

The board-2.bin that Kalle allows the modem start, but it fails to
associate or really do anything useful beyond announcing a SSID in AP
mode.

Anyways: I think it's mostly just an issue with the IRQ affinity --
maybe the threaded NAPI patch is changing it somehow...

Cheers,
Tyler
