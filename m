Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16247C
	for <regressions@lists.linux.dev>; Sun, 28 May 2023 07:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hX9P5lvl8LgTgqVaadxLEgewbYd4/EQz3gtdX5/LcvQ=; b=Be07+G93NyFsGhXgT2GahsLqcz
	euE0VVDkUpez5z5OY+iJmU3ZxAuGLXvclLMXNzEs5zVUnpXMecIZ7tUzKVHy0G8bN3CjFI2/0ew6a
	7wSGcGtR2QrurQ99rfp9Oe6BaVgFqoBXM17hCQLzCWwFzfdI/eeYMjRB0isxDTg8wIDS7Gna43foX
	Z6v4sNPuEgJi+YNNADfyrtwQAgnw2mlN2rDutwWafWWdzXRtrE5kGCqahZaBVEKs248wu9VnE+T40
	8WKQMUcXGEaaCFNdZCRuktuJt9qM1cf0s5xJyWf+aijuEdO7HMla64N2XpUk1UUY0oLRfUmBuvKdW
	3vn++SUQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1q3ADR-00CsP3-7E; Sun, 28 May 2023 06:49:21 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 3E194BE2DE0; Sun, 28 May 2023 08:49:20 +0200 (CEST)
Date: Sun, 28 May 2023 08:49:20 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Nick Hastings <nicholaschastings@gmail.com>, 1036530@bugs.debian.org,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Regression from "ACPI: OSI: Remove Linux-Dell-Video _OSI string"?
 (was: Re: Bug#1036530: linux-signed-amd64: Hard lock up of system)
Message-ID: <ZHL5cCNUzVdleiag@eldamar.lan>
References: <168471337231.1913606.15905047692536779158.reportbug@xps>
 <ZG3mbc3zdR4KcUW/@eldamar.lan>
 <ZG6cY8xjfob4Bvcs@xps>
 <ZG98fQ+MD4O0nGGE@eldamar.lan>
 <168471337231.1913606.15905047692536779158.reportbug@xps>
 <ZG/8cxxTJ9ZzrVPQ@xps>
 <ZHCYRmD7YeIWoy2W@eldamar.lan>
 <168471337231.1913606.15905047692536779158.reportbug@xps>
 <ZHKrC4/G6ZyvRReI@xps>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHKrC4/G6ZyvRReI@xps>
X-Debian-User: carnil

Hi Mario

Nick Hastings reported in Debian in https://bugs.debian.org/1036530
lockups from his system after updating from a 6.0 based version to
6.1.y.

#regzbot ^introduced 24867516f06d

he bisected the issue and tracked it down to:

On Sun, May 28, 2023 at 10:14:51AM +0900, Nick Hastings wrote:
> Control: tags -1 - moreinfo
> 
> Hi,
> 
> I repeated the git bisect, and the bad commit seems to be:
> 
> (git)-[v6.1-rc1~206^2~4^5~3|bisect] % git bisect bad
> 24867516f06dabedef3be7eea0ef0846b91538bc is the first bad commit
> commit 24867516f06dabedef3be7eea0ef0846b91538bc
> Author: Mario Limonciello <mario.limonciello@amd.com>
> Date:   Tue Aug 23 13:51:31 2022 -0500
> 
>     ACPI: OSI: Remove Linux-Dell-Video _OSI string
>     
>     This string was introduced because drivers for NVIDIA hardware
>     had bugs supporting RTD3 in the past.
>     
>     Before proprietary NVIDIA driver started to support RTD3, Ubuntu had
>     had a mechanism for switching PRIME on and off, though it had required
>     to logout/login to make the library switch happen.
>     
>     When the PRIME had been off, the mechanism had unloaded the NVIDIA
>     driver and put the device into D3cold, but the GPU had never come back
>     to D0 again which is why ODMs used the _OSI to expose an old _DSM
>     method to switch the power on/off.
>     
>     That has been fixed by commit 5775b843a619 ("PCI: Restore config space
>     on runtime resume despite being unbound"). so vendors shouldn't be
>     using this string to modify ASL any more.
>     
>     Reviewed-by: Lyude Paul <lyude@redhat.com>
>     Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>     Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
>  drivers/acpi/osi.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> This machine is a Dell with an nvidia chip so it looks like this really
> could be the commit that that is causing the problems. The description
> of the commit also seems (to my untrained eye) to be consistent with the
> error reported on the console when the lockup occurs:
> 
> [   58.729863] ACPI Error: Aborting method \_SB.PCI0.PGON due to previous error (AE_AML_LOOP_TIMEOUT) (20220331/psparse-529)
> [   58.729904] ACPI Error: Aborting method \_SB.PCI0.PEG0.PG00._ON due to previous error (AE_AML_LOOP_TIMEOUT) (20220331/psparse-529)
> [   60.083261] vfio-pci 0000:01:00.0 Unable to change power state from D3cold to D0, device inaccessible
> 
> Hopefully this is enough information for experts to resolve this.

Does this ring some bell for you? Do you need any further information
from Nick?

Regards,
Salvatore
