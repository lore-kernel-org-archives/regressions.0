Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC5BA934
	for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 08:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692778881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2oaSMHcvqCziX2gO1IwQweHiiwucxeoyE3Pu01d/lk=;
	b=bugnEVqx+E0LZprUZZxt/6AYQPVnGestjre6aInx5FK44nkFmzYq35PG3jggClSeJ72KYt
	nbXHD8RAqs4vRVvZWbpiVzkZC48yj1TJD/5cgTQZYmJlVW7N6y3RXQ0J0WtlQYOpPUi9Kd
	iXLuaX3PtbB8/wDQetMaQ7R2Pfhv284=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-FncZnhZ6OMyQvveQHP_tEQ-1; Wed, 23 Aug 2023 04:21:20 -0400
X-MC-Unique: FncZnhZ6OMyQvveQHP_tEQ-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-564656d952aso5744191a12.3
        for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 01:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692778879; x=1693383679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2oaSMHcvqCziX2gO1IwQweHiiwucxeoyE3Pu01d/lk=;
        b=RSyB3HAkJcwnO6XjHDetOOuiskfxxM+AUy7e4mb8NbNHCFI1epUWHY8+MAKsZI1n6r
         6w+D0CawwRLM88STnhs5bFmm7Npfco92Bx1sGG75PLSvFYImnZ/w2XXhijAyUCy6zRRt
         qCQn4dR6ikxwYseQh336bgixm0FiaPpZFUuetTzqWWVBbNvD7GwDT23Lev+kZSHbArKr
         yRGAMVjEe9xQza18Xz8axZK5+aP87Ynj7uHpxc8CjFgFfWDGaTUPLEBV38veQHpKPhf+
         VJy7QNFVRWMevZD+T+fSzRcSaSzP6hpWEE9ZXC/IKfDwLBEBrCkCt46FcDcqVkVp+w6N
         yx/A==
X-Gm-Message-State: AOJu0YzE97/jXBxJTq3FchcxkTbWVONehsD4xldSfttQCNfqV6xYfgOL
	aK72YENmple+UWrPQYxlt0pnYgp8qK+p+jXBjYPzzF4Csa1KgnNBpRMU6QHEyxKIUrdfG9CR8wC
	1FcnbCpQirRkEDNLrudRGwaAXzqimx70QIz9Bww==
X-Received: by 2002:a17:90b:396:b0:26b:49de:13bd with SMTP id ga22-20020a17090b039600b0026b49de13bdmr8555262pjb.36.1692778879353;
        Wed, 23 Aug 2023 01:21:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2AOpuxpUJRRzJJlV3nnAX5OBFVvXSzcpjdc536DBn27Tjre2yixkzE6HTRX8vc8jIbWNoRGGfw9Pz4M+wnyA=
X-Received: by 2002:a17:90b:396:b0:26b:49de:13bd with SMTP id
 ga22-20020a17090b039600b0026b49de13bdmr8555256pjb.36.1692778879042; Wed, 23
 Aug 2023 01:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+cBOTeWrsTyANjLZQ=bGoBQ_yOkkV1juyRvJq-C8GOrbW6t9Q@mail.gmail.com>
 <20230821131223.GJ3465@black.fi.intel.com> <CA+cBOTc-7U_sumg6g-uBs9w3m8xipuOV1VY=4nmBcyuppgi8_g@mail.gmail.com>
 <20230823050714.GP3465@black.fi.intel.com> <CA+cBOTdS5djXL=93VThP9K67pjYKHtjceqSczKf8NQonhpgo5Q@mail.gmail.com>
 <20230823074447.GR3465@black.fi.intel.com> <20230823075649.GS3465@black.fi.intel.com>
In-Reply-To: <20230823075649.GS3465@black.fi.intel.com>
From: Kamil Paral <kparal@redhat.com>
Date: Wed, 23 Aug 2023 10:20:52 +0200
Message-ID: <CA+cBOTco17b_8ZMhU8gXy8z2mtZXvVxrEUdKaAuZMhyFYC3yeQ@mail.gmail.com>
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-pci@vger.kernel.org, regressions@lists.linux.dev, 
	bhelgaas@google.com, chris.chiu@canonical.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 9:56=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> So directly after resume the PCIe link (tunnel) from the Thunderbolt host=
 router
> PCIe downstream port does not get re-established and this brings down
> the whole device hierarchy behind that port. The delay just made it take
> longer but the actual problem is not the delay but why the tunnel is not
> re-established properly.

If you want to compare it to a "fast" resume (~5 sec, before commit
e8b908146d44), here's dmesg:
https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1984726

Even when the resume is fast, it takes a few extra seconds before the
devices on the dock are usable in the OS. For example, my USB mouse
connected to the dock doesn't work immediately, I have to wait a few
more seconds. The ethernet on the dock also reconnects only after a
few extra seconds.

> Next question is that what's the Thunderbolt firmware version? You can
> check it throughs sysfs: /sys/bus/thunderbolt/devices/0-0/nvm_version

$ sudo cat /sys/bus/thunderbolt/devices/0-0/nvm_version
20.0

Here's whole `fwupdmgr get-devices` output, if that helps:
https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1984728

Before reporting this bug, I updated the firmware on the Dock itself
to the latest version (had to use Windows for that). The dock should
have now this firmware:
https://pcsupport.lenovo.com/us/en/downloads/DS506176
Which is:
    Tool package V1.0.25
    TBT FW: C44
    PD FW: 1.38.07
    DP hub: 3.13.005
    Audio: 04-0E-87_Rev_0087
according to the Readme file. That seems to match the "44" version in
the fwupdmgr output.

> I
> see the BIOS you have seems to be quite recent (06/12/2023) so that
> probably should be good enough.

Lenovo seems to support it through LVFS, so that's what I use for
updating the BIOS. Version 0.1.54 was updated quite recently and it
seems to be also the latest version they have on their website.

