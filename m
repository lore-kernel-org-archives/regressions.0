Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC97770E0;
	Thu,  9 May 2024 22:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715293412; cv=none; b=EbShkKHEkYP5rvOI/6mFEOLoSvHRTM/VIUCsv8VxRcdGtYapgy/oFaSluIDKLJg3ZHR7TDh8OeE0sk8JxG59K/eLf5GwxP391jPjVxG2W+l79Wb5j8VRdW2HGIkUao0ohX54mt3dZhNBSTzt0mILucDu72VtfOVGCRRoAZTxGsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715293412; c=relaxed/simple;
	bh=ujtHeXGGZ+idJFPVBlDBxelVhiQm6qMxCY59RV0nu7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYXnCdmVHelAMx4qEPAcy9gd874z2pMOzSr37yVMGiEd9v8qxdm3TEI7ttRZ6/X9rViCQoI/3OWRSA3DR/cahIV/j+fMblMBwaQIPuTMP4+QyHVB9bQ5h+556rF2KA2+qOECyhot4wlyw0l4EKf/mNmKxaPn1orCNKDnoY5hrg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSKrVsBc; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSKrVsBc"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e34e85ebf4so12289051fa.2;
        Thu, 09 May 2024 15:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715293409; x=1715898209; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkAPHuFAqgVKkwPXOmVKd4nEJl7twGAILgmFeDyg/14=;
        b=iSKrVsBcFiUgxtIDHz2Jrd23nnIiJonGqJSCgV//RrJp52+pFR+V3N3TKemwyaS4ZV
         vUjMWdfzH11CA3ZXag/6yQkTnyDZL1gy+/0c88YMA63EknIx3DLwd4t83mXdkqkq/upv
         8OanB+Zk1PIs89sB7ZCswNcWYpoblJ+iZ9+86FNF14Fd/eMLgrqQDjwQ9me/XMxRbPzh
         AAJoH3EbUBTERHu+XX0Nadq/NLmZmcCXSIc1dHVo2eiXQRj2GasqcsFZNpkdUcXOiZcx
         zWymYjHUeZuYsthXLaRJHd+AkHSjG1SAkIg+09A3upsvLygfCga7waTC8BopGtEhSRTu
         aAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715293409; x=1715898209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkAPHuFAqgVKkwPXOmVKd4nEJl7twGAILgmFeDyg/14=;
        b=fpxZyEBhF6Cw4vaR2B4OXtHr6udAdKFqq4jeeJVP7kuGJTnhMFYXa7GIIs1GNbfhLT
         znC4ZmTWoMQoOYYoZZYJASvebav8jgBr//Wm7x8njONDqzHZBeoOLLxonpesbZbqazIP
         97FjGCHBeRRiqJWq+8cfEHih58YhfhRzqBgEYdXBhzXIrIhKq9NQVZgQz/FPW+ThmexJ
         NDONFhRBXkBz9g/V579wh85FATpPUtBxjvzGB+j2c5CM4vBw7EFuEzeKXUMNWLPV3duF
         qcsEoMLiCbzwvyiwbYXvHVMwuErTi986ZAOOWHkx1HwVI4fNVlb8CR7HIE9JSIu5I+au
         /YbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl3u7jT8iCtIfJsM5qQDog0T/f0/5M0gkFjXNCzrWwxzFlPFzh7gUHx7yiEkr4bTMSVuFtKMJJDNy9hujNQiGpUlFtOoxnbWZY1VZpfSJGYI77mQVUrSVZStg5emupihOCGQ==
X-Gm-Message-State: AOJu0YxdCornnHdwC84fJdH8G3fZ03DdgDngDtXdMXvmEMX3iHenaFqB
	Fmi+3D3ReksNZ2GKGvAoYsEMSenyl0LyQbOwvjcqMU237Ahg98jtMHEF74clInTRboQFlGigjaG
	ZTPT/0LJRZ0F1YJNbBdKMFvyX6m0=
X-Google-Smtp-Source: AGHT+IGLe/J80f0oxe7aMe45qxKdLEoNXDk0U0AAhmjA3BkH7bcJsQ9vyZ7yq8lTCRIWXKTsxD3HDmYrA53UkViRG2c=
X-Received: by 2002:a2e:9253:0:b0:2e2:a0f0:4e74 with SMTP id
 38308e7fff4ca-2e5203a44b5mr3717461fa.52.1715293408869; Thu, 09 May 2024
 15:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240405204037.3451091-1-luiz.dentz@gmail.com>
 <Zjz0atzRhFykROM9@robin> <CABBYNZLMODHp+jBu2oVDC5Pg6fyAKJugQF0N-XgarjWQJJPObg@mail.gmail.com>
 <Zj0tcmseJCjR4hK2@robin>
In-Reply-To: <Zj0tcmseJCjR4hK2@robin>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 9 May 2024 18:23:15 -0400
Message-ID: <CABBYNZLnYz-vPrMbtsJTsLPsyo62j+cxctSkLjRom3bWEU9N3A@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: hci_sync: Use advertised PHYs on hci_le_ext_create_conn_sync
To: Janne Grunau <j@jannau.net>
Cc: linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Janne,

On Thu, May 9, 2024 at 4:09=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> On Thu, May 09, 2024 at 12:30:21PM -0400, Luiz Augusto von Dentz wrote:
> > Hi Janne,
> >
> > On Thu, May 9, 2024 at 12:06=E2=80=AFPM Janne Grunau <j@jannau.net> wro=
te:
> > >
> > > Hej,
> > >
> > > On Fri, Apr 05, 2024 at 04:40:33PM -0400, Luiz Augusto von Dentz wrot=
e:
> > > > From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > > >
> > > > The extended advertising reports do report the PHYs so this store t=
hen
> > > > in hci_conn so it can be later used in hci_le_ext_create_conn_sync =
to
> > > > narrow the PHYs to be scanned since the controller will also perfor=
m a
> > > > scan having a smaller set of PHYs shall reduce the time it takes to
> > > > find and connect peers.
> > > >
> > > > Fixes: 288c90224eec ("Bluetooth: Enable all supported LE PHY by def=
ault")
> > >
> > > This commit in v6.8.9 apparently has regressed connecting to LE devic=
es
> > > like Logitech mices with Apple/Broadcom BCM4388 devices. Those device=
s
> > > carry HCI_QUIRK_BROKEN_LE_CODED which became necessary after 288c9022=
4eec
> > > ("Bluetooth: Enable all supported LE PHY by default").
> > > Tested so far only by reverting aaf06285498861d6caaff5b26d30af70dd2b8=
19f
> > > on top of v6.8.9. Looking at the change I don't see anything obvious
> > > which would explain the breakage.
> > > I would assume v6.9-rc6 is affected as well but I haven't tested this
> > > yet.
> >
> > Would be great if you provide the HCI trace to confirm the problem.
>
> looks like there is an issue with initiating "LE Extended Create
> Connection":
>
> | > HCI Event: LE Meta Event (0x3e) plen 26
> |       LE Extended Advertising Report (0x0d)
> |         Num reports: 1
> |         Entry 0
> |           Event type: 0x2515
> |             Props: 0x0015
> |               Connectable
> |               Directed
> |               Use legacy advertising PDUs
> |             Data status: Complete
> |             Reserved (0x2500)
> |          Legacy PDU Type: Reserved (0x2515)
> |           Address type: Random (0x01)
> |           Address: DF:F4:9E:F3:A9:72 (Static)
> |           Primary PHY: Reserved

Looks like broadcom is using Reserved value as primary PHY, no wonder
it doesn't work, real piece of art that broadcom and apple manage to
produce and it is not only the PHY that has out of the spec result
other fields are affected as well.

> |           Secondary PHY: No packets
> |           SID: no ADI field (0xff)
> |           TX power: 127 dBm
> |           RSSI: -60 dBm (0xc4)
> |           Periodic advertising interval: 0.00 msec (0x0000)
> |           Direct address type: Public (0x00)
> |           Direct address: 5C:1B:F4:7F:BF:6B (Apple, Inc.)
> |           Data length: 0x00
> | < HCI Command: LE Set Extended Scan Enable (0x08|0x0042) plen 6
> |         Extended scan: Disabled (0x00)
> |         Filter duplicates: Disabled (0x00)
> |         Duration: 0 msec (0x0000)
> |         Period: 0.00 sec (0x0000)
> | > HCI Event: Command Complete (0x0e) plen 4
> |       LE Set Extended Scan Enable (0x08|0x0042) ncmd 1
> |         Status: Success (0x00)
> | < HCI Command: LE Extended Create Connection (0x08|0x0043) plen 10
> |         Filter policy: Accept list is not used (0x00)
> |         Own address type: Public (0x00)
> |         Peer address type: Random (0x01)
> |         Peer address: DF:F4:9E:F3:A9:72 (Static)
> |         Initiating PHYs: 0x00
> | > HCI Event: Command Status (0x0f) plen 4
> |       LE Extended Create Connection (0x08|0x0043) ncmd 1
> |        Status: Unsupported Feature or Parameter Value (0x11)
>
> Full trace attached
>
> Janne



--=20
Luiz Augusto von Dentz
