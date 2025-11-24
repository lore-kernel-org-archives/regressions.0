Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795C126F467;
	Mon, 24 Nov 2025 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763990070; cv=none; b=hkV/VSOtfYM9Fob9CyLRYDkBply6w8HMZLA6WvBawtJBUmHp8nYVB5okP/0boQaAiu6jYB80opwSjA2gISwBnI7NnmjZKVOR0hj5RGYFikffTn4eOSDse72v1F6QfIFNFRHVCGxN8fz9IXz8Ydnqwr6xvpt2iqnA2NJO9QZ6XUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763990070; c=relaxed/simple;
	bh=RkP3XoBrROfWxpPBrDgZoNSdZ6SM16qUrh12yE+95MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9LyaVBK7znPWaAG2E8s2XYpEwuhz5m39EKcWhY0WHUijCSXQ/uTmV2W56k2UQzDTCJsjdwK3pof/GLOYJ3MDqq4UgvLNfQRayYhfEyrzI/aK7GJhRxOFz2ZsHILK02C+q+w/O5XU/6WghUNtKFYAfDsTuujkibJ9Chu67zNoZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmZ/16DT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmZ/16DT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E64EC116C6;
	Mon, 24 Nov 2025 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763990070;
	bh=RkP3XoBrROfWxpPBrDgZoNSdZ6SM16qUrh12yE+95MM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmZ/16DT0AV5S1MN9ZABpryaAZ3eE5oVUK1vVTDTfYkNQzDDlagWodLtTcSEHSRHE
	 bBx8CzXdWq6kmAoB0um7jWzu6RT21Mfp0Y3UUfrAI5iWePndMdFXpN7ipEpuY+4Xvg
	 wUGWCymAWyCllQgPeKsZ8sBhc3U6xtF/RTRcQlBafh5TYS2ZCqC8fIh3Ys8LYgDJUW
	 xYw++b6a0Eae2yMUU3qNcVzlRd20nTzHxqDqLVCgqcj6fbs1H77qJSk8OYmdc7VyP/
	 Hx1Yi91I9FhKM2ctMbelRoQU4RInZZX77QIz2CdYeKYKZ2up2tFxBslyS0aHGgWBZz
	 S4d793LsYiBxg==
Date: Mon, 24 Nov 2025 13:14:24 +0000
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, catalin.marinas@arm.com,
	gshan@redhat.com, aneesh.kumar@kernel.org, sami.mujawar@arm.com,
	sudeep.holla@arm.com, steven.price@arm.com,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] GHES firmware can't be readonly - Was: Re: [PATCH
 v3 3/3] arm64: acpi: Enable ACPI CCEL support
Message-ID: <aSRaME9ZO-nchE1I@willie-the-truck>
References: <20250918125618.2125733-1-suzuki.poulose@arm.com>
 <20250918125618.2125733-4-suzuki.poulose@arm.com>
 <20251121224611.07efa95a@foz.lan>
 <4a750da6-7883-4afa-94c1-4806677e61c2@arm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a750da6-7883-4afa-94c1-4806677e61c2@arm.com>

On Mon, Nov 24, 2025 at 05:21:00AM +0000, Suzuki K Poulose wrote:
> On 21/11/2025 21:46, Mauro Carvalho Chehab wrote:
> > Hi,
> > 
> > Em Thu, 18 Sep 2025 13:56:18 +0100
> > Suzuki K Poulose <suzuki.poulose@arm.com> escreveu:
> > 
> > > Add support for ACPI CCEL by handling the EfiACPIMemoryNVS type memory.
> > > As per UEFI specifications NVS memory is reserved for Firmware use even
> > > after exiting boot services. Thus map the region as read-only.
> > > 
> > > Cc: Sami Mujawar <sami.mujawar@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> > > Cc: Steven Price <steven.price@arm.com>
> > > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > > Cc: Gavin Shan <gshan@redhat.com>
> > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > Tested-by: Sami Mujawar <sami.mujawar@arm.com>
> > > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > ---
> > >   arch/arm64/kernel/acpi.c | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> > > index 4d529ff7ba51..b3195b3b895f 100644
> > > --- a/arch/arm64/kernel/acpi.c
> > > +++ b/arch/arm64/kernel/acpi.c
> > > @@ -357,6 +357,16 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
> > >   			 * as long as we take care not to create a writable
> > >   			 * mapping for executable code.
> > >   			 */
> > > +			fallthrough;
> > > +
> > > +		case EFI_ACPI_MEMORY_NVS:
> > > +			/*
> > > +			 * ACPI NVS marks an area reserved for use by the
> > > +			 * firmware, even after exiting the boot service.
> > > +			 * This may be used by the firmware for sharing dynamic
> > > +			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
> > > +			 * as read-only.
> > > +			 */
> > >   			prot = PAGE_KERNEL_RO;
> > 
> > Please revert this change.
> > 
> > Making area reserved to be used by firmware breaks some APEI
> > notification mechanisms:
> 
> Thanks for the report. Clearly, we missed this case. I am happy for this
> patch to be reverted and we can work out the handling of NVS later.

I'll revert the change shortly.

Will
