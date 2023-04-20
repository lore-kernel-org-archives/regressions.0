Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875424432
	for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681983009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cDEs65ZY4C9svszuIZjn2vdR/JFQxFQIyNLFZevs4tE=;
	b=cIYoCgnBIPSd7QH2/2Lm/7TiivV9+D26d+LPdsSqbOD6YuyML1hb6TBo/ais3rG0+K/EBm
	XfSPV4noL2NBrTYSsPZ3eNAudrCYhVddrzB15hpWLV8dtzdlL8K1Iw+ZlshSicMPR56e7O
	rovrifU1UOOImd2IRGeE7DrNJbD1mKs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-ZBy4ar7iOOOoGvUJ6dUU9A-1; Thu, 20 Apr 2023 05:30:08 -0400
X-MC-Unique: ZBy4ar7iOOOoGvUJ6dUU9A-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-2f40f52c604so284494f8f.0
        for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 02:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681983007; x=1684575007;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDEs65ZY4C9svszuIZjn2vdR/JFQxFQIyNLFZevs4tE=;
        b=X/0MdaIer3EiFTmVmFfmTWB3O3YK/TLTvwgHwJSK0jJD5XXKNJ6UO6KTB69kHuqhMT
         fzkrqpCIAO1h9R8apW7EnI+8vwZ5dOldRv1DKniocGyJltJJduuYInzs+fVvzdndYPKS
         9fzu32RQGVAssnt7krYmYlWGjRZse70ewhNghwAo4U+9eE4ufyePgAOppdyxx+dakktN
         MJ2E9VMvZw4kSCvqdwSJneasdVypMc9wV9lxxJkQdNyPyadRXJEJM5lYS/hKwibbXdvP
         P5Zi0oxPl5gbtx9E0CwJGnS+4fZsSUMCHkmMpv2LGySuNrz24NtqzcJxrWL2yKj3csu0
         jv/g==
X-Gm-Message-State: AAQBX9cPjZl/RSCGYStPWrIIWnGz0Zt8SjlzzcMVB/Ikk5xtylL4Kmos
	nZujoqtW+0R0r7uHMqGgLFNAADrL0q9rrBSa9CrMAuFAFN0a4OCxyRkfeMTCIwqwix/NBE3b13L
	yhd14tOCrY7CYnZoBYT6jBV4=
X-Received: by 2002:adf:efca:0:b0:2f5:5538:2589 with SMTP id i10-20020adfefca000000b002f555382589mr845801wrp.31.1681983007069;
        Thu, 20 Apr 2023 02:30:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350YMtYMcOObUPin35/aM2AJ1xnbjW42cLOVhTBp9bVJzETGAUNOgAqF9WAusiYj56KscOLEdXw==
X-Received: by 2002:adf:efca:0:b0:2f5:5538:2589 with SMTP id i10-20020adfefca000000b002f555382589mr845771wrp.31.1681983006729;
        Thu, 20 Apr 2023 02:30:06 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id t15-20020adfe44f000000b002f00793bd7asm1478740wrm.27.2023.04.20.02.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 02:30:06 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>, Binbin Zhou
 <zhoubinbin@loongson.cn>, Liu Peibao <liupeibao@loongson.cn>, Huacai Chen
 <chenhuacai@loongson.cn>, Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 mstowe@redhat.com
Subject: Re: [PATCH] PCI: Restrict device disabled status check to DT
In-Reply-To: <20230419202042.GA223738@bhelgaas>
References: <20230419202042.GA223738@bhelgaas>
Date: Thu, 20 Apr 2023 11:30:04 +0200
Message-ID: <87leimnboj.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Bjorn Helgaas <helgaas@kernel.org> writes:

> [+cc Vitaly, Jesse, Tony, Andy, regressions, regarding reports of
> hang or crash during boot in igb driver, some with AWS Xen]
>
> On Wed, Apr 19, 2023 at 02:35:13PM -0500, Rob Herring wrote:
>> Commit 6fffbc7ae137 ("PCI: Honor firmware's device disabled status")
>> checked the firmware device status for both DT and ACPI devices. That
>> caused a regression in some ACPI systems. The exact reason isn't clear.
>> It's possibly a firmware bug. For now, at least, refactor the check to
>> be for DT based systems only.
>> 
>> Note that the original implementation leaked a refcount which is now
>> correctly handled.
>> 
>> Fixes: 6fffbc7ae137 ("PCI: Honor firmware's device disabled status")
>> Link: https://lore.kernel.org/all/m2fs9lgndw.fsf@gmail.com/
>> Reported-by: Donald Hunter <donald.hunter@gmail.com>
>> Cc: Binbin Zhou <zhoubinbin@loongson.cn>
>> Cc: Liu Peibao <liupeibao@loongson.cn>
>> Cc: Huacai Chen <chenhuacai@loongson.cn>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>
> Applied to for-linus for (hopefully) v6.3.  I added:
>
>   [bhelgaas: Per ACPI r6.5, sec 6.3.7, for devices on an enumerable
>   bus, _STA must return with bit[0] ("device is present") set]
>
>   Link: https://bugzilla.kernel.org/show_bug.cgi?id=217317
>
> It would be really great if anybody who has seen this issue could test
> and report whether this patch solves it.
>

[Cc: Myron]

I can confirm the patch fixes the issue I've reported with AWS Xen
instances, so:

Tested-by:  Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly

