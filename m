Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EDC2C0F6C
	for <regressions@lists.linux.dev>; Mon,  3 Nov 2025 07:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762155630; cv=none; b=OjxPM/34/XAA4yrixcd5i2BwDOVmjPhtbRfCg/N7ZGlvizSR8niClGHCZdDdoyWMtDS4s56T2wHqMEcbiUGVi5CPSKtccB7keBI8unKHhNd62l+uRjY8OTDeneysKKh+NN4+DhnM4iWOF0ow1K0xqcl6Uxf2UJEMdHGtAWjpBWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762155630; c=relaxed/simple;
	bh=SlYci0dHrICe6IYWx0Y+e0NJm66MSzaFWjZ4oIwtkgM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lbvwl8KEgMk09P6PbJi88bLoUhQ9QPK7enxyjZ1qqecY/SPoEIE6pYRivAhaw9Ox4VALj/E8+5+LPavUjN3tvbcGwWcFbVgF9Ze/g9pKnbvZvcXQELs/qpCpTyRQR7A62G86pcZ18A5yLyLbjo7xfXw0K/sRZk6zvAZ8Fl9JTrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5A5Tr2H; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5A5Tr2H"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b472842981fso548202566b.1
        for <regressions@lists.linux.dev>; Sun, 02 Nov 2025 23:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762155626; x=1762760426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2AFHpbxsNUgkkbbq9RMTdgycoyfFsp4yUttyYC4IbY=;
        b=Z5A5Tr2HRjQ7E5pt2MMSUYJUpByEY03c8hKsgZem4BE9/0FeUYKtB0zRwbhKW1XSZ3
         5aW40OwTQQ93OaxywW5DOh3QSKllMuCj73vNeBi2Ib0I2na0aXec6Tseq5FYFssMuPhR
         rhjVIujcgDqhs9URznHiTf3/fszCMF4sfND9HtvJGITru1dALKVKJLccdVyW7uHuysws
         SU64mf1pKCNlNt67sIDjJsM3DCW7JKYrEedWgwRMxiYz/CsOZyX8RNHAQR8iO8U4e0VV
         feoLXsja4TPAkiQHIT0BP0YQH2+G1NUYceW6IHJhF41hj00xtBYTYECfa11pB8cClaB+
         c+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762155626; x=1762760426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2AFHpbxsNUgkkbbq9RMTdgycoyfFsp4yUttyYC4IbY=;
        b=hbiRkXHjZGRTnYYA/kj60FFpsBFI1TOPZEiOnJiXREovCvRziO5SzhEtGiU81CX7PX
         1WHKWr5vmSx/UhE8QDhIr0iDo7OWzYpknqBPusKJjwxM1BBck0gzIlS0QwwWKy6IMw1m
         IquCmYMSzFR1Y/w+gCEgCWNAVMdZ29gmdcTfXRlVf/6bEtuizBGDZJL+aVVcD4HBRU7O
         kxeRnVHMkE+FqrDkBUKjyKfMFbhYJ7zS9LvEfPKg5mnwArWhVsOPSvxlmxB15bdj1GNy
         dmggy/7ExX+slslW/GPh8m0ullO6j8hRHwBhFIXjh3n4S7Ub0yPoboZhAXbn/Lv5iF2j
         1ZvA==
X-Forwarded-Encrypted: i=1; AJvYcCVeQxhwJoD0WFWLf+7CAfU/UxKemH61hf/8Yik6RAoyepOo+YRRAk4Vsfik9bvhHANDby0FkjprOVp8Og==@lists.linux.dev
X-Gm-Message-State: AOJu0YynC7ogEk8SaQKOmmLPbjAZ5geJULNCueIbixFBn02qF5DItYqN
	ZoqTSYOmvPLgzbWa02IXZrKQyOorEpgOZ9y3zrt88/D92531m7iLRANugZn5ow==
X-Gm-Gg: ASbGncu4b+6Y5yYVOZXNCOILhdqN02bZF/1ynhmfX7rC2FUS28UTLBa38PJ/pso1m7u
	FrRT1Xp6KYpPGkqFlIXW3lubiqYfQiiyjo6vBoJ1dHgbwKe5zXKscz/HPzll6lBZ1k8z6NB7vuO
	QniLhtdP8wG1K9uDIwxguy3RDgYoFJDsqagz+uhCJgO68CzFrMr0mcLGdJgb0xN/9BbbTAVVPzU
	Qr0UilhQJsffhqPyWrqQ1ehgyS0ihFXOQRFR1oVhNtJaVlegQy7vhb8QZFSWv6up7RPS0Ob5w1i
	xu4ZVCywc/yN0ExO9n/6y6QCiSQwGeq2snvl6k0cGDhLuNcJRCE3xisOh4FNp93vhLOYAvfg7qG
	j8suTAk8fYraECHAdSv8/6eDlusUXsL4vnpqEWjKwGofHLE7QUGUq84pWVwLyoYvQsybFf8D36D
	c3xZX/vHScI70t8EaZeIrvavM=
X-Google-Smtp-Source: AGHT+IGKT2y7pvRw9Ei6hvplikIPDxCl0VQxMHigFaaEnt+tk1MLnjtl0oCPOkTCngJEh5b5IFkpeA==
X-Received: by 2002:a17:907:7f0f:b0:b6d:536f:ada with SMTP id a640c23a62f3a-b7070627837mr1069754166b.43.1762155626262;
        Sun, 02 Nov 2025 23:40:26 -0800 (PST)
Received: from foxbook (bgu110.neoplus.adsl.tpnet.pl. [83.28.84.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077c3ad94sm963280266b.47.2025.11.02.23.40.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 02 Nov 2025 23:40:25 -0800 (PST)
Date: Mon, 3 Nov 2025 08:40:21 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: x86@kernel.org, regressions@lists.linux.dev, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Mario Limonciello <mario.limonciello@amd.com>, Eric
 DeVolder <eric.devolder@oracle.com>, linux-kernel@vger.kernel.org
Subject: Re: AMD topology broken on various 754/AM2+/AM3/AM3+ systems causes
 NB/EDAC/GART regression since 6.14
Message-ID: <20251103084021.61971a89.michal.pecio@gmail.com>
In-Reply-To: <20251024213204.GA311478@yaz-khff2.amd.com>
References: <20251024204658.3da9bf3f.michal.pecio@gmail.com>
	<20251024213204.GA311478@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Oct 2025 17:32:04 -0400, Yazen Ghannam wrote:
> So far, I think the way to go is add explicit quirk for known issues.
> 
> Please see the patch below.
> 
> Thanks,
> Yazen
> 
> 
> From eeb0745e973055d8840b536cfa842d6f2bf4ac52 Mon Sep 17 00:00:00 2001
> From: Yazen Ghannam <yazen.ghannam@amd.com>
> Date: Fri, 24 Oct 2025 21:19:26 +0000
> Subject: [PATCH] x86/topology: Add helper to ignore bogus MADT entries
> 
> Some older Intel and AMD systems include bogus ACPI MADT entries. These
> entries show as "disabled". And it's not clear if they are physically
> present but offline, i.e halted. Or if they are not physically present
> at all.
> 
> Ideally, if they are not physically present, then they should not be
> listed in MADT. There doesn't seem to be any explicit x86 topology info
> that can be used to verify if the entries are bogus or not.
> 
> Add a  helper function to collect vendor-specific checks to ignore bogus
> APIC IDs. Start with known quirks for an Intel SNB model and older AMD
> K10 models.
> 
> Fixes: f0551af02130 ("x86/topology: Ignore non-present APIC IDs in a present package")
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>  arch/x86/kernel/cpu/topology.c | 52 ++++++++++++++++++++++++++--------
>  1 file changed, 40 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/topology.c b/arch/x86/kernel/cpu/topology.c
> index 6073a16628f9..704788b92395 100644
> --- a/arch/x86/kernel/cpu/topology.c
> +++ b/arch/x86/kernel/cpu/topology.c
> @@ -219,6 +219,45 @@ static unsigned int topo_unit_count(u32 lvlid, enum x86_topology_domains at_leve
>  	return cnt;
>  }
>  
> +/*
> + * Some older BIOSes include extra entries in MADT.
> + * Do some vendor-specific checks to ignore them.
> + */
> +static bool ignore_extra_apic_entry(u32 apic_id)
> +{
> +	u32 pkgid = topo_apicid(apic_id, TOPO_PKG_DOMAIN);
> +	struct cpuinfo_x86 *c = &boot_cpu_data;
> +
> +	/* Allow "physically not possible" cases if in a guest. */
> +	if (!hypervisor_is_type(X86_HYPER_NATIVE))
> +	       return false;
> +
> +	/* This model only supports 8 threads in a package. */
> +	if (c->x86_vendor == X86_VENDOR_INTEL &&
> +	    c->x86 == 0x6 && c->x86_model == 0x2d) {
> +		if (topo_unit_count(pkgid, TOPO_PKG_DOMAIN, phys_cpu_present_map) >= 8)

Looks like possible functional change compared to the code it replaces,
perhaps it should be a separate patch?

> +			goto reject;
> +	}
> +
> +	/*
> +	 * Various older models have extra entries. A common trait is that the
> +	 * package ID derived from the APIC ID would be more than was ever supported.
> +	 */
> +	if (c->x86_vendor == X86_VENDOR_AMD && c->x86 < 0x17) {
> +		pkgid >>= x86_topo_system.dom_shifts[TOPO_PKG_DOMAIN - 1];
> +
> +		if (pkgid >= 8)
> +			goto reject;

Yes, this works. The excess entries are counted as "rejected" rather
than "hotpluggable", package count is correct and EDAC/GART are back.

But to be exact, the known case is (apic_id >= 0x80) rather than
(pkgid >= 8). The latter assumes not only that there are no more than
8 packages, but also that their IDs start from zero.

I have this AM4 system with some proprietary HP BIOS:

[02Fh 0047 001h]               Local Apic ID : 10
[037h 0055 001h]               Local Apic ID : 11
[03Fh 0063 001h]               Local Apic ID : 12
[047h 0071 001h]               Local Apic ID : 13

domain: Thread     shift: 0 dom_size:     1 max_threads:     1
domain: Core       shift: 4 dom_size:    16 max_threads:    16
domain: Module     shift: 4 dom_size:     1 max_threads:    16
domain: Tile       shift: 4 dom_size:     1 max_threads:    16
domain: Die        shift: 4 dom_size:     1 max_threads:    16
domain: DieGrp     shift: 4 dom_size:     1 max_threads:    16
domain: Package    shift: 4 dom_size:     1 max_threads:    16

It seems that pkgid is 0x1 here, which is not a problem because
it's single socket, but dunno if HP or somebody else couldn't do
similar things in an 8-socket system and end up with pkgid > 8.


By the way, do you know what's the reason I don't have /sys directories
for those phantom CPUs (before this patch) and should I have them if
they were legitimate hotplug CPUs?

Maybe there is already some check performed in other part of the kernel
which rejects those CPUs and which could be replicated here.

> +	}
> +
> +	return false;
> +
> +reject:
> +	pr_info_once("Ignoring hot-pluggable APIC ID %x.\n", apic_id);
> +	topo_info.nr_rejected_cpus++;
> +	return true;
> +}
> +
>  static __init void topo_register_apic(u32 apic_id, u32 acpi_id, bool present)
>  {
>  	int cpu, dom;
> @@ -240,19 +279,8 @@ static __init void topo_register_apic(u32 apic_id, u32 acpi_id, bool present)
>  		cpuid_to_apicid[cpu] = apic_id;
>  		topo_set_cpuids(cpu, apic_id, acpi_id);
>  	} else {
> -		u32 pkgid = topo_apicid(apic_id, TOPO_PKG_DOMAIN);
> -
> -		/*
> -		 * Check for present APICs in the same package when running
> -		 * on bare metal. Allow the bogosity in a guest.
> -		 */
> -		if (hypervisor_is_type(X86_HYPER_NATIVE) &&
> -		    topo_unit_count(pkgid, TOPO_PKG_DOMAIN, phys_cpu_present_map)) {
> -			pr_info_once("Ignoring hot-pluggable APIC ID %x in present package.\n",
> -				     apic_id);
> -			topo_info.nr_rejected_cpus++;
> +		if (ignore_extra_apic_entry(apic_id))
>  			return;
> -		}
>  
>  		topo_info.nr_disabled_cpus++;
>  	}
> -- 
> 2.51.1
> 
