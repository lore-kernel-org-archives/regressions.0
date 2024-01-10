Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553D828E8
	for <regressions@lists.linux.dev>; Wed, 10 Jan 2024 03:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="JB96nfXx"
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3E96B3F18E
	for <regressions@lists.linux.dev>; Wed, 10 Jan 2024 03:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704858253;
	bh=pLgcyTZenokYx0uGkUKde9DGt3BHdUFOCmdzdzfj8Zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=JB96nfXxcu3WdHAzoWp0Puat/DIC8YgfFA4e41kKDPBDc3vvQS8PS2OfoQbizRvyp
	 Rt0Ggj7Ya89rua1xY2NEr9sAdA2nBgRPX7+204dKkt0UlFvD0ZJYinTLUDxe4gEJQa
	 4LWfSevm2gvXUjRCpEjFeKvxk/xdjVLrBICXgeSKejia1bkddJGGFv7QM8DfOYFefI
	 SqjdW2+6DW15sv9ipbPUNBRtUoVpFRLJRK916ZXthfT47yQcF9KylGjLGjpafSqGlk
	 DoNHuaFiRWqOuLukvhyZWLbeyoCbRULx0A4V7p48S8zEmcBywDmB7AYpQnZ5OpNt0o
	 x5og6i7lrWdsQ==
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5984ac4b896so2716302eaf.2
        for <regressions@lists.linux.dev>; Tue, 09 Jan 2024 19:44:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704858252; x=1705463052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLgcyTZenokYx0uGkUKde9DGt3BHdUFOCmdzdzfj8Zs=;
        b=NWlc4Ipkwxwaf0AeNvz4j5SqVmPuMLV7HZGw1LGO8tXqj0nm5MvFqOhkRrf30eXrMv
         8ldh5Be13K0WLA5PgKxbhK5rsmK95eGMDwCGxcjOUhsqm1HTPcnDk1PZ6su+/zy+bZYm
         b2VK7X9GsRsTu7OGjALSmg7L6X/G9bx9xl1oVkYKRIYI8g36Sr69d8EsdHHQ2yNoZqse
         HSvN/APhFscKEfrLtsctBpruwvVgyEpJJMqdAvvDesPeUmVJ2cbnv756Tt17SCMwavhu
         WkXWk1MMJtDqNYjT83GJmnsk/TTSSD5mzvD1jOjLh+cL4D9fbgvEjFXSYZ0ic/lpv/DK
         F2oQ==
X-Gm-Message-State: AOJu0Yz1UvgnY1yLanSaOwlm3N/sGWMt0j4aIkL4DKvginw3h3dUXzMF
	W4QGsbPbdYVRs0x543jehYG5ybJrN9elflQWHwjdRoeaxXSe+qHJ4dYz/MWA0fvT2ud0kKgDaxm
	6KU/uH98xnSMlCoE4GmTMA5cRVPwyWfO8v2VYnZnvm46A/q/l7/T43s3yVQHw5EM=
X-Received: by 2002:a05:6359:4c1a:b0:175:6b16:437 with SMTP id kj26-20020a0563594c1a00b001756b160437mr372158rwc.41.1704858251846;
        Tue, 09 Jan 2024 19:44:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHP3KLBfcLw7NKm+OUg78KN9DAiPdJNkz+1tdABIJcKUQk//5olHZgCKbLN9WY67WMLQLRq+vqwQ7ef67NbgVI=
X-Received: by 2002:a05:6359:4c1a:b0:175:6b16:437 with SMTP id
 kj26-20020a0563594c1a00b001756b160437mr372145rwc.41.1704858251500; Tue, 09
 Jan 2024 19:44:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <954f0b86-dd9e-4d84-8d67-fba7e80bc94e@5challer.de> <20240105155100.GA1861423@bhelgaas>
In-Reply-To: <20240105155100.GA1861423@bhelgaas>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 10 Jan 2024 11:43:58 +0800
Message-ID: <CAAd53p5Eg4J9bRtAHY+JZ11cy1D0TnKmAaLfzcRJzw15VRBxXw@mail.gmail.com>
Subject: Re: [Regression] [PCI/ASPM] [ASUS PN51] Reboot on resume attempt
 (bisect done; commit found)
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Michael Schaller <michael@5challer.de>, bhelgaas@google.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, macro@orcam.me.uk, 
	ajayagarwal@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	gregkh@linuxfoundation.org, hkallweit1@gmail.com, 
	michael.a.bottini@linux.intel.com, johan+linaro@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 11:51=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Jan 05, 2024 at 12:18:32PM +0100, Michael Schaller wrote:
> > On 05.01.24 04:25, Kai-Heng Feng wrote:
> > > Just wondering, does `echo 0 > /sys/power/pm_asysnc` help?
> >
> > Yes, `echo 0 | sudo tee /sys/power/pm_async` does indeed also result in=
 a
> > working resume. I've tested this on kernel 6.6.9 (which still has commi=
t
> > 08d0cc5f3426). I've also attached the relevant dmesg output of the
> > suspend/resume cycle in case this helps.
>
> Thanks for testing that!
>
> > Furthermore does this mean that commit 08d0cc5f3426 isn't at fault but
> > rather that we are dealing with a timing issue?
>
> PCI does have a few software timing requirements, mostly related to
> reset and power state (D0/D3cold).  ASPM has some timing parameters,
> too, but I think they're all requirements on the hardware, not on
> software.
>
> Adding an arbitrary delay anywhere shouldn't break anything, and other
> than those few required situations, it shouldn't fix anything either.

At least it means 8d0cc5f3426 isn't the culprit?

Michael, does the issue happen when iwlwifi module is not loaded? It
can be related to iwlwifi firmware.

Kai-Heng

>
> Bjorn
