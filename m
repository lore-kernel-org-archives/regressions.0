Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBD01F61C
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 14:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695823999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UwGMspXDuqQwgGzZQ7MuwnixR8r/6+yX41PkMftGYz4=;
	b=M2U8IdRsqyWQVLmC4YF8kQqAmfOE+hzj5pKtIx16dwu150Ngn0mlKHFhefzxQS4tcKiT5d
	hDQ/mgYgLQkL5y8EONKhagZqh3i0SZtb2In2owjkS/rHdZmcrTgoZx3Q1CNuYrOAnzLa9y
	J2t7V3rQhnn/8pFjRf6ETSjmZbvAQyo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-IpAFPWgrNOWl-Cj7GxRbLQ-1; Wed, 27 Sep 2023 10:13:17 -0400
X-MC-Unique: IpAFPWgrNOWl-Cj7GxRbLQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2790596f212so556284a91.1
        for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 07:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695823996; x=1696428796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwGMspXDuqQwgGzZQ7MuwnixR8r/6+yX41PkMftGYz4=;
        b=ncL14zravowNhOsGZ8Y8Sm0EO8ziGNb+hJi+KsyweUfgKZOSmAr2Nt4gs2p9NVQx3Y
         FAcVM9JKPo+lXcKXnYJoN3PyCtlnCWGVJF4CqPSmr2R2haG+mql8LhhUAQfaNPIAAw6O
         cMQao7y3QmlHCwpOJXgzD0zRWy+z7H9OSn1dLv9ALCVPj2D9HHZCVrZ3Y8lniozyIpr0
         UXuj2mrE6ziplIpn/clHjtg6flmlMSFR/cfp1ajM1caQVku8Wd191vYkzDZooW45/6lR
         azW640S451ksbQ3pIYLDb6kvoGVgqI/YsdGuc+6UaUm4fHr6aBm8WV6uGVJCFmo7USNY
         nHKQ==
X-Gm-Message-State: AOJu0YxQGdjy6dbtVJoAmJd0X/o0xorTlfpAHXgxPuQ/ntJGRpY1qTK7
	pnIfU3dreITOm9GqoyxAuyRlsyDwASDcs0/5l3YL25ggn/0NMwoadpD1MxEWblTB7qgIPN0xcri
	zP4mmGSSENqfcw0Q0YAOPoTD/odG/WqAja5aljaZ9YS9iBelG
X-Received: by 2002:a17:90a:e2d4:b0:269:c7d:aac5 with SMTP id fr20-20020a17090ae2d400b002690c7daac5mr1678423pjb.3.1695823996060;
        Wed, 27 Sep 2023 07:13:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxiMFukLiuzoGHKM4zkNgY+ZCPmKLqqpigDPJnXvN+8OlgRMYmM8AtfsgIlhi9BQNL7S1WZyvC4P++uPO/6pk=
X-Received: by 2002:a17:90a:e2d4:b0:269:c7d:aac5 with SMTP id
 fr20-20020a17090ae2d400b002690c7daac5mr1678404pjb.3.1695823995777; Wed, 27
 Sep 2023 07:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230925141930.GA21033@wunner.de> <20230926175530.GA418550@bhelgaas>
 <20230927051602.GX3208943@black.fi.intel.com> <CA+cBOTds9k1Q2haC_gTpsUvjP02dHOv9vSconFEAu-Fsxwf36A@mail.gmail.com>
 <20230927135346.GJ3208943@black.fi.intel.com>
In-Reply-To: <20230927135346.GJ3208943@black.fi.intel.com>
From: Kamil Paral <kparal@redhat.com>
Date: Wed, 27 Sep 2023 16:12:49 +0200
Message-ID: <CA+cBOTfCy-KOptir9yfkVz1=bfOTPQanqe9ofX-jphm7oeBEXg@mail.gmail.com>
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org, 
	regressions@lists.linux.dev, bhelgaas@google.com, chris.chiu@canonical.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 3:53=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> If you apply the patch from here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=3Dp=
m&id=3D6786c2941fe1788035f99c98c932672138b3fbc5
>
> Does the problem go away with the disconnect case too (and so that you
> have "secure" enabled)?

Thanks, I'll test it, but I can't do it this week. I'll reply next week.

