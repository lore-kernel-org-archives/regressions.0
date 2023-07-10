Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CB911C8B
	for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 18:01:36 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4036d80caaeso28709281cf.2
        for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 11:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689012095; x=1691604095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2mAb04uNq1AMHQNpvPDDERYq9CZGbl5fsMiRCnuOFIc=;
        b=opD2DNKdWmu40noOfYNxRV4vxH/LowhkkIXvYL/dihAlv4F11HxG7tOWywntDBxZ51
         2HDCJpZ21XWmTjZNwugv5QczXc5JB0afrOBWEcZ/pAR8EV26t24abxWu9xZ4Jyn6jZ1x
         67hLvzElobdKg24WLx4oLO+VEWJtIqai4XBUWRcl4pq8J7KDCHrHvpfYDdEsjQ3jyIMN
         d2uCQzkX4Ymufmya/IcVahFgcem1U7DUU/JwXgzemx1FLt0BY8QMlSJeYYZqZtO6uLB/
         YdLmBZQqWf2AH/JWPSi8FMPPUJtyZEhNxkjMHxdI9UaXV4v7fj+9N1sheO9LlQb08bvV
         +/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689012095; x=1691604095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mAb04uNq1AMHQNpvPDDERYq9CZGbl5fsMiRCnuOFIc=;
        b=jp8fbB3p3a4yHDgWuUjLrYdv/8sOY1UuVhIqn7pTcwMhylZ0bvXqNVGgyqF16Hggz+
         W9i0Noz5gNyJxT8UKDGImsIuvji2AURDms7mJtijoKXRYar+sev4lRocjmr/vEswNkV9
         3vAFwRrFPXtD70bK2JhVBtUran6No4DdDhMo7XXF1eIkPktKktaiO9UBTLA9ugXSw0OM
         mquozgp9DwxItVrIT3q8ZLjQxGBX4N/dfuTYOoIZdjXLs+cOfM0xK4FsIRisvnmvv44t
         thtoauGZaGUXMSn1B/63O/9dHA/JXG4JcAPggpePBS7XSUGE1hYcj5scUYnKWfAwvfGP
         RAPQ==
X-Gm-Message-State: ABy/qLZzMZEW2PkJWo9GwwubiPDjUUVQs16XAZiNuOIYgFeM+66Da05G
	qN8CSOEcr2twhLWO3mTFoneNEA==
X-Google-Smtp-Source: APBJJlFNIJ0STG/YX8tdMDnIoyf46UgtWo9nXXVxz3w2y7YTJeLvp5i08w3/IHh/aX3saMFV/M2A6A==
X-Received: by 2002:a05:622a:148b:b0:401:ec6d:3870 with SMTP id t11-20020a05622a148b00b00401ec6d3870mr15990391qtx.11.1689012095010;
        Mon, 10 Jul 2023 11:01:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id f7-20020ac84647000000b003e4d9c91106sm145530qto.57.2023.07.10.11.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 11:01:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qIvCX-0004TE-RP;
	Mon, 10 Jul 2023 15:01:33 -0300
Date: Mon, 10 Jul 2023 15:01:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian Hesse <mail@eworm.de>
Cc: linux-integrity@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Peter Huewe <peterhuewe@gmx.de>, stable@vger.kernel.org,
	roubro1991@gmail.com
Subject: Re: [PATCH v2 1/2] tpm/tpm_tis: Disable interrupts for Framework
 Laptop Intel 12th gen
Message-ID: <ZKxHfTkgKHYqhBz2@ziepe.ca>
References: <20230710133836.4367-1-mail@eworm.de>
 <20230710142916.18162-1-mail@eworm.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710142916.18162-1-mail@eworm.de>

On Mon, Jul 10, 2023 at 04:28:43PM +0200, Christian Hesse wrote:
> This device suffer an irq storm, so add it in tpm_tis_dmi_table to
> force polling.

I can't help but feel like we are doing something wrong in the Linux
driver that we keep having IRQ problems.

Surely Windows uses the IRQ on these devices? How does it work
reliably there?

Jason
