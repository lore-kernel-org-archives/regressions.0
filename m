Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75725200DF
	for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689181211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V34PBFVRSyPmXY6TnLemmwcb7RItdmjHqC9gKS1fTBo=;
	b=ImrScq87XqUGoRkeYux4zrfRcNTiHlbW04a++6u6V7TFlSUDMApQVMGQjVvIdjHIFIIJO1
	FgJSjTp97E/ph/kPH+qB6iTN7dqLfnr3Uk0U5xUh6StWkjtV6/CCakiV6ZEVrYJDq/eZtn
	NhjjdygbZYTUBbhSOgTKIFmVO1dN4w4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-xSU1n97rMkS0KBd7TGVhJQ-1; Wed, 12 Jul 2023 13:00:08 -0400
X-MC-Unique: xSU1n97rMkS0KBd7TGVhJQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-765986c0521so690101785a.3
        for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 10:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689181208; x=1691773208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V34PBFVRSyPmXY6TnLemmwcb7RItdmjHqC9gKS1fTBo=;
        b=POehFo/Q5tMgL8zM7JsM8k4RZpDVWmLiwsHRL+jyi/QD+Goyg8q4j1p5zkWh5J9v5P
         l234I8RziYrWxl8ty6JDvGRWjCwouRAG500GbJMLiwphpurlx0D/STg2RO3BoWfwuyiG
         QUwj//FG9Bo+zrMjzDlYbqkL5tG29U9zYHclFRbFYKoNzVdK2bfvTUIwrkG/dXxf53Zb
         P23Wv6NnMdL9Xr9wUlredfPFmrh5XDXnxdHj8d4xO5ekxLH8jYF4Cx8hFZrAPTe4h4v2
         fhxGs8Z+9QINMsMr3C9kFb8eAWEssdc63zoB0qo4oGHUnFCwUXTWxve/cAkRXAmjgpXD
         zjlw==
X-Gm-Message-State: ABy/qLb6V9jj3dMAFotF8Qye5/i0xmCmOZffn9XIB0HmHbB+Z+2sq2+1
	puqAOhGy4n9TjvLu4WPJKfG4XoCtWz7AXHGgfU7KbvZSahHLzUBCToQ3X6sQHWWhBep52rvddVY
	4maFup5WMcn9O4kAtSjf2dzo=
X-Received: by 2002:a05:620a:318f:b0:765:4418:cac7 with SMTP id bi15-20020a05620a318f00b007654418cac7mr18968022qkb.73.1689181208071;
        Wed, 12 Jul 2023 10:00:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGfbsBm1Dqr0aQLF1S4fgHLvR9TbsCSLLXCvHTFTZHyd5eS5VdOP6vDZI4492sbHtDleRsIrg==
X-Received: by 2002:a05:620a:318f:b0:765:4418:cac7 with SMTP id bi15-20020a05620a318f00b007654418cac7mr18967998qkb.73.1689181207795;
        Wed, 12 Jul 2023 10:00:07 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id w18-20020a0cb552000000b0063004b5482csm2342328qvd.92.2023.07.12.10.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 10:00:07 -0700 (PDT)
Date: Wed, 12 Jul 2023 10:00:05 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christian Hesse <mail@eworm.de>, linux-integrity@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Lino Sanfilippo <l.sanfilippo@kunbus.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Peter Huewe <peterhuewe@gmx.de>, stable@vger.kernel.org, 
	roubro1991@gmail.com
Subject: Re: [PATCH v2 1/2] tpm/tpm_tis: Disable interrupts for Framework
 Laptop Intel 12th gen
Message-ID: <qvt4ndqc23ftspjtpljyv45yfhtxi6oomjios2nuk34bs7n5fi@2ye4znwhgn4a>
References: <20230710133836.4367-1-mail@eworm.de>
 <20230710142916.18162-1-mail@eworm.de>
 <ZKxHfTkgKHYqhBz2@ziepe.ca>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZKxHfTkgKHYqhBz2@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 03:01:33PM -0300, Jason Gunthorpe wrote:
> On Mon, Jul 10, 2023 at 04:28:43PM +0200, Christian Hesse wrote:
> > This device suffer an irq storm, so add it in tpm_tis_dmi_table to
> > force polling.
> 
> I can't help but feel like we are doing something wrong in the Linux
> driver that we keep having IRQ problems.
> 
> Surely Windows uses the IRQ on these devices? How does it work
> reliably there?
> 
> Jason

I worry about it as well, especially as more vendors get added to the
list. On the other hand it seems like every 6-12 months I am
interacting with vendors that repeatedly forget to have reserved
memory regions added to IVRS and DMAR tables for devices that need
them. So I guess it is possible for the problem to be on their end as
well. For at least one case that someone looked at back in May, it
looked like he could see the issue looking at a schematic for the
system.

Regards,
Jerry

