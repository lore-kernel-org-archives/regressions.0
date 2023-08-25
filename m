Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2598A210C
	for <regressions@lists.linux.dev>; Fri, 25 Aug 2023 08:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692953004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCP2Xqg2OKBHB7tOPm2sgvbABZBA3Of3A/9A5xghgpE=;
	b=X9Wh+9ygh0D2hDOFQdOg1vLczeJTMeKm+lhaxMxyXfXixt7jmTY8k+NgphWAdOGPLQRcB6
	/qfosO9HXpDzcuWikpTUnQKd89GvLyFF1Q0Rh0R+NcWFE0jMa1AMFfgWYz1yxdj9x7bEWB
	0cNyHnjk+2cDBcijKAUMoxFv91eCBi4=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-iDXQcVUEM9uzYRQ11ZfMBw-1; Fri, 25 Aug 2023 04:43:23 -0400
X-MC-Unique: iDXQcVUEM9uzYRQ11ZfMBw-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1b07f5f7b96so674372fac.2
        for <regressions@lists.linux.dev>; Fri, 25 Aug 2023 01:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692953002; x=1693557802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCP2Xqg2OKBHB7tOPm2sgvbABZBA3Of3A/9A5xghgpE=;
        b=XeARefxXxMdmaXdkAsW8DepRSQ6yC0X+H15uhErJ9VG1wGI7hIV2bWr+yhC28rRFXl
         AEu70CUdWI3f7jEE4UZ/169U4DYEpAdNTtVTXF4EC/tGdgcfDStjfBzqLB1Y6P7vv/K1
         92wo37eUoppNCUwEARTRNij5XpjjLxYZfzoDU+ohuJHtoyjRY2U7QaRQmbzAPejD1DmQ
         4TCjp/ZptZut3e1l3tX/jmsHhVhYNqcbOQJ4DrAvDmDMv9E8hYq8tHRAE8LOIsa/+gxo
         AZMpeHZ2dsXBh7aTwVNZ5j60ssNThTLWl+GFBwTeWtU604oyRk7brS32Hie5vCw7E4x3
         42EA==
X-Gm-Message-State: AOJu0YwmNlM2HnUarB7pPMCR966qg5br6zoCsbEv8j0OxV0Uj1Giclo1
	xIYJdSsts27VX5Uw5myWM4atw3ZN8tgPCmqCublDUtxOrYTQPfQgaf7uCIDFSgod/+sOGKm/Sub
	6oSiDwzlcjE3DxaorWX03H3LG95cSNwz38yNm/g==
X-Received: by 2002:a05:6870:d1ca:b0:1c8:39a6:77a9 with SMTP id b10-20020a056870d1ca00b001c839a677a9mr2329018oac.31.1692953002303;
        Fri, 25 Aug 2023 01:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+Z/kiU7ATmiquWx9l1gQfwBTS3mrikpiiF2jq2BCklQjFyUDEiDnWhj/JdW/QWLIfyvO23NoK11yKVsyDc2E=
X-Received: by 2002:a05:6870:d1ca:b0:1c8:39a6:77a9 with SMTP id
 b10-20020a056870d1ca00b001c839a677a9mr2329007oac.31.1692953002103; Fri, 25
 Aug 2023 01:43:22 -0700 (PDT)
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
 <CA+cBOTco17b_8ZMhU8gXy8z2mtZXvVxrEUdKaAuZMhyFYC3yeQ@mail.gmail.com>
 <20230823090525.GT3465@black.fi.intel.com> <CA+cBOTeOSBkw_-AM6desmdVQjTXUZbKppK_PDiOM3sXQW5QKiA@mail.gmail.com>
 <20230824114300.GU3465@black.fi.intel.com>
In-Reply-To: <20230824114300.GU3465@black.fi.intel.com>
From: Kamil Paral <kparal@redhat.com>
Date: Fri, 25 Aug 2023 10:42:55 +0200
Message-ID: <CA+cBOTej22hWEFvMOnFfKy16tuzS_+S7kccPPYXNoGVbYMoEdA@mail.gmail.com>
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-pci@vger.kernel.org, regressions@lists.linux.dev, 
	bhelgaas@google.com, chris.chiu@canonical.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 1:43=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> One thing I noticed, probably has nothing to do with this, but you have
> the "security level" set to "secure". Now this is fine and actually
> recommended but I wonder if anything changes if you switch that
> temporarily to "user"? What is happening here is that once the system
> enters S3 the Thunderbolt driver tells the firmware to save the
> connected device list, and then once it exits S3 it is expected to
> re-connect the PCIe tunnels of the devices on that list but this is not
> happening and that's why the dock "dissappears" during resume.

That was a great suggestion. After switching to the user security
level, the resume delay is gone, and my dock devices seem to be
working almost immediately after resume! The dmesg for that is here:
https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1985262

I've done tens of cycles and haven't found any race conditions, unlike
with the TB assist mode. (Only once, my USB mouse wasn't working at
all, but that's something that occasionally happens on most docks I've
worked with and seems to be some different issue).

I'm sorry I haven't found this earlier myself. I did try switching
these options, but I bundled it together with enabling the TB assist
mode, which has quirks, so I didn't realize switching just this one
option might have an impact.

> In any case we can conclude that the commit in question has nothing to
> do with the issue. This is completely Thunderbolt related problem.

Considering the information above, does this appear to be a solely
dock-related issue (bugged firmware), or does it make sense to follow
up on this in some different kernel list? I have to say I'm completely
OK with running the laptop using the "user" TB security level, but if
you think I should follow up somewhere to get the "secure" level fixed
(or some workaround applied, etc), I can.

Thanks a lot for all your help debugging this, Mika and Bjorn.

