Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E2F366
	for <regressions@lists.linux.dev>; Mon, 27 Oct 2025 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761562130; cv=none; b=QMr3zhdWuqAFtsArLsJw2C5CkHm5Ukt2Yxeq60+U0BEuqfGv6LD/ri/WIANeA+fZShVe4kCcq4ztzos6Mam+uj+1C6eSjpl2oFbR9Lf4OffHrJwvQrWIxAPrT3XslitVouIppGDsRCiOJBb/mv91nnG7tIsI5qGP5ZQA9x8ke7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761562130; c=relaxed/simple;
	bh=umtddTp0GUxsAGi2WcJAkAXnZmZ64sCaxtd5YSgfVyI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vCtb3Iejb5dptlGguEsmO5454/O9c2x5DaGzDeciImVKyrncf3uqQ2nth1hSjd1jrJAXvEHS82RnGOb/E/MAEG7M8sG7ENu9s/Ccee0A6gNsYOIjyUM8/XJ4cVUPlVXJhssoaBpoKeaWK6cyGVQ6YsOTZ4aWXGkCKM2nDzMIx58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=Dd/rixVb; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="Dd/rixVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761562120; x=1762166920; i=spasswolf@web.de;
	bh=xBBB0/r3+zMZ8FLcXBHWliMhsxPeLrTWHXQx/nJII7k=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Dd/rixVbAbFnS0xZg2eDMZbDuUW0qWq0HaLNdNMtcQ0ykVhxUz3Xi9qH6t/+JRO/
	 s6NPbAwMb81CJY3/aEA7LYmLesVDX6I3GmfEHCvJySQDCS9HzUPStskpQt/qTTFk7
	 KOZ19kETol21i+X2zG5ExBPyfh4dT786Kp/EJfCgUOClSkudBFasFByaSuFkqFd8m
	 vroDxut2SJC60JSgFEU6NYv8Enq5W12/j9wxWDpLRouhEQMDACjPFnRxAedI2KkUm
	 sFT2Zc4Uw6acaMPJlXuQ13vb2RIZ9+Xe1hSNEJBpgyJazqXZxp+kQsPhfxtvxE8K4
	 AWvzeHfe3ERY5qlPeg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N2BHw-1u9zSO1DNm-00toae; Mon, 27
 Oct 2025 10:57:22 +0100
Message-ID: <1853e2af7f70cf726df278137b6d2d89d9d9dc82.camel@web.de>
Subject: Re: [REGRESSION 00/04] Crash during resume of pcie bridge
From: Bert Karwatzki <spasswolf@web.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Mario
 Limonciello <superm1@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, regressions@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, "Rafael J . Wysocki"
	 <rafael.j.wysocki@intel.com>, spasswolf@web.de
Date: Mon, 27 Oct 2025 10:57:20 +0100
In-Reply-To: <25f36fa7-d1d6-4b81-a42f-64c445d6f065@amd.com>
References: <20251006120944.7880-1-spasswolf@web.de>
			 <8edcc464-c467-4e83-a93b-19b92a2cf193@kernel.org>
			 <4903e7c36adf377bcca289dbd3528055dc6cfb32.camel@web.de>
			 <4a8302a0-209f-446a-9825-36cb267c1718@kernel.org>
			 <25f36fa7-d1d6-4b81-a42f-64c445d6f065@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sOokDG2zNh3dGu6GLilMaYmINMVkmc585yxfydkehC9TH71Wm8U
 DQ3klqzHdDBMROx+mIt5UnWDBqO4Fp5N3caIp/zJRaTMvPCH67zbpO5PlEpKa7+jDGQQI8X
 Y23WC11H6R9b+8SUAjHRiGNrsKJluF9f1r9srHtYAuBl4fFaq58Mkyb5IgpFKdhgT9MUFCX
 kChNvBOkZe6yS+2J+OTjA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2LsclnQ1df4=;lrrBkC940CpUVt4ERWtmkUfNw26
 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

>=20
> >=20
> > As an idea for debugging this issue, do you think maybe using kdumpst =
[1] might be helpful to get more information on the state during the crash=
?
> >=20
> > Since NVME is missing you might need to boot off of USB or SD though s=
o that kdumpst is able to save the vmcore out of RAM.
> >=20
> > Link: https://blogs.igalia.com/gpiccoli/2024/07/presenting-kdumpst-or-=
how-to-collect-kernel-crash-logs-on-arch-linux/ [1]
> > >=20
> >=20

I've tried kdump to get a dmesg from the crash but it does not work. In ca=
se of the crash a normal reboot
occurs. When causing a crash with "echo c > /proc/sysrq-trigger" kdump wor=
ks as expected. I tested this
with kernel 6.15.11 because kdump didn't work with next-20250917 at all.

But there are some things I found out:
(a) The temporarily missing nvme device issue can also occur when crashing=
 with "echo c > /proc/sysrq-trigger"
(b) The crash can occur both when resuming and suspending the discrete GPU=
.
(c) On the current debian trixie stock kernel 6.12.48+deb13-amd64 any atte=
mpt to use the discrete GPU
    gives a segfault because resume is broken. It works on 6.12.52 so this=
 is a debian bug.
(d) Using the dev_info() and examining the last messages transmitted via n=
etconsole I found that the crash
    occurs during a call to acpi_power_transition() with the following cal=
ltrace
 =C2=A0
   hotplug_event() (in drivers/pci/hotplug/acpiphp_glue.c)
-> acpiphp_check_bridge()
-> pm_runtime_get_sync()
-> __pm_runtime_resume()
-> rpm_resume()=C2=A0
-> pci_pm_runtime_resume() (This is the callback called after the skip_par=
ent label of rpm_resume())
-> pci_pm_default_resume_early()
-> pci_pm_power_up_and_verify_state()=C2=A0
-> pci_power_up()
-> platform_pci_set_power_state()
-> acpi_pci_set_power_state()
-> acpi_device_set_power()
-> acpi_power_transition()

Bert Karwatzki
