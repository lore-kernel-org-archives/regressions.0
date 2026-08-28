Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5123D5227
	for <regressions@lists.linux.dev>; Fri, 28 Aug 2026 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914959; cv=none; b=CH5/GzzfP+w3FobDELDtYk0+n+7bCnqZdbJ8fO8xpvGeVsMC3IRfdQui/bhJ40B5X1y3NV5mVlpQzPnO/NUAgKmY4YzMF579Ne/HyDItm6PkD4uCLVNSpgNlzxfplo/fvPPgEc+O/MNTOD4PEdfrcsIsT9YLoA6CO9/DmqolTCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914959; c=relaxed/simple;
	bh=PZOxbkSyo2Wd9KRPQTNlBN8b6sV2MpnNkaeoZtqPgYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BDhw3nNrkSK3baEAJpK/xTzDmFLDrI9PE7ZVJg0kH3I/A8DXesFRJcSi0oQm0qvVdWA3LI+zzWKX4+f+WqTNGmduUPCyMGNDCJ2Zv8fGzWNx3k/VgfYRLLM/nFDMK85gwtlUYQ8/juh11BLVNhWrlTdNST8o63Junn8ZNwZP80U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9P5e8UF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9P5e8UF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39647184c73so1924340a91.1
        for <regressions@lists.linux.dev>; Fri, 28 Aug 2026 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787914957; x=1788519757; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JfxjOcdt/cjC9WpCoszCuxVA1vXbX2Ek4UTj+Uf54lQ=;
        b=C9P5e8UFMs6371walKt05SqyEG/5bxxJXdGIQFY659hlDpyEBph3xVx0XK8ftYDJOv
         l30SbNThdFgG6sBzZb6WghbbfDK08o8/1uYiD92NhdFwk4aJv1DrfO6Ofh0lj71tN1YS
         S+w3dRp3dUhFilH0W/st7OTDYC1iA4ZTsnFk4WsQwBkiOavXschbxrKkqzeA4OrFk7FJ
         TxK1YM42q5HTyX+dmr7eDvk3QEijtPrbQf3a31k1tJLrvlE9t59KLw7wA6Tz6z9vGL0W
         dFDjxoXs7W1IvgOiiAhI/BV/rr7s381rehq6lDRmKvrmJAGY9SvgzWScL91Fx+0infHL
         Uamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787914957; x=1788519757;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfxjOcdt/cjC9WpCoszCuxVA1vXbX2Ek4UTj+Uf54lQ=;
        b=dn6BD2Y0g/umd6Ae30MKJc4KWvDLfksnWhvg9qysRVcawNGuerlT4abu+7TLjPAREG
         1ez/RIEUAXLSyeLBmkHCiZ3ZCnjoMm02YfhlrGkx66OC9ESwvrzrrkyF2TKgOYrBpZMb
         j5+8F18bKmydzxkh147+/rXn6JLthjH3JY+EH2MBI+QmLjsYzRAXX6OtUglfQqFNDQa+
         ExlUDdiSv4K2lpvI8A+feF6nDhe6ZrCFiR86KPXgkY38UXEPSogdZBf/niGpJTHcjtou
         H/5F6+dJeGmFg6rsRCfCuIR25nJDvLNYKuqFFvWMxG8cuOYUih24FmIMzSpG8gNGgXjr
         gLsA==
X-Gm-Message-State: AFuF++lahfYbsPJ0siu1OXsK/7JuVzOEKBo9AjuL/+F7HJnWvnqH03FZ
	olDyW33bqPEcZMmmnPAgfk5aPeSL0HWlRxx+pDMCzcxj73ipErKvCxMu
X-Gm-Gg: AR+sD10h3qsAM4LyRP2uGwt/U3u1cwu+N1GGXWDX1MiV7uRfv50Y8aEZiMRchtqvNsM
	kBYlvJrHEh2wumtTO8dNCX8mVxXcFYMLkPZmj4KWUS9ZaLJlofeU1jHfZdv1JmYU7rcV7eBAD5V
	Fnq5hlmq+p4fhcLnPTu8urgWVfMksqZPfT1Xd1ZLf2OUzPqdyoJAUhRA5okNKmQqZURxa6Z0WHN
	xFbUAFJ+8/yAx0AQxRotB3SjEYGF9hmePmVXTuEY6mrwTaI6vVrc+p7NPOMayArcdXOtOeSt6UE
	E8Y/vNOCCotbzOQZSS2noRB/DbN27Jsdp3oqX4Twd0EL2g8SPrgLtqjP95WMPVvvVn5VszbqyRt
	kaCUhnyZjdqI8Sienns4X0KbNkTraW1fFfF2cD+WUh3RaojSkrQjIpC3olPGvIWaysvgyo+lSSd
	BbS4fSzOvLm5HkjXknOFzJgMHrATy+LnFli8tr0Px9tYfyv3tkrHO6SofAOPHdA28IYSd0w3eAj
	7z7VNtI6/peunF8kLL1kSksCVOu8ioqg11OEVchF74cxA5iu41Marj9/t4WEnwc+SU=
X-Received: by 2002:a17:90b:3945:b0:38e:4f31:8412 with SMTP id 98e67ed59e1d1-3969bc02508mr20315417a91.11.1787914957056;
        Fri, 28 Aug 2026 04:02:37 -0700 (PDT)
Received: from [127.0.1.1] (ppp-124-121-113-94.revip2.asianet.co.th. [124.121.113.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc898dsm5088597c88.9.2026.08.28.04.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 04:02:35 -0700 (PDT)
From: Mikael Etienne <mikael1022bzh@gmail.com>
To: vasant.hegde@amd.com, iommu@lists.linux.dev, linux-ide@vger.kernel.org,
 linux-block@vger.kernel.org
Cc: regressions@lists.linux.dev, joro@8bytes.org,
 suravee.suthikulpanit@amd.com, Mario.Limonciello@amd.com
Subject: Re: [REGRESSION] Silent SATA read corruption with dma-iommu on AMD
 600-series AHCI (6.19 good, 7.0+ bad)
Date: Fri, 28 Aug 2026 18:02:29 +0700
Message-ID: <178791494900.1152725.12728124457005560389@gmail.com>
In-Reply-To: <c5c2b503-e273-4aa5-ad9f-f7afee02ab9e@amd.com>
References:
 <CAHEgv3TiJUvS=Hustyem0ts8jkbFVAdzBazmPhCbv2sNnTsZkg@mail.gmail.com>
 <c5c2b503-e273-4aa5-ad9f-f7afee02ab9e@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On 8/28/2026 11:13 AM, Vasant Hegde wrote:
> Can you please apply Commit 1e75a8255f11c81fb and retest. Also boot with
> `amd_iommu=pgtbl_v2`?
>
> @Mario, Can you look into this issue? Is this similar to the one you were
> debugging internally?

Hi Vasant,

Thanks for the quick response.

I checked before testing, and I believe that commit is already in my kernel.
CVE-2026-68329 lists it as fixed in 7.1.6 with 02f8cefa2ad95ea3754f0cfd6fbae7f866202ccb
(and in 7.2-rc5 with 1e75a8255f11c81fb07e81e5029cfd75804350a0, the one you
pointed at). I am running Fedora's 7.1.10-200.fc44, whose changelog says
"Linux v7.1.10", so the 7.1.y backport should be present.

And I have reproduced the corruption on kernels that already contain it. On
7.1.9 my journal has 119 corruption lines for a single boot on 2026-08-23, and
the 20-million-error run described in my first mail was on 7.1.10.

There is a second, independent reason to think it may not be my bug: that CVE
says the race was introduced in 3.0. My persistent journal goes back to
2026-02-27 and shows zero storage errors under 6.18.16 and 6.19.x, including two
full multi-TB backup reads of the same drive on 2026-04-01 and 2026-05-01. If I
were hitting the 2011 race, I would expect it to show there too. What I see
looks like something that appeared between 6.19 and 7.0.

I may of course be wrong about the Fedora build. If you want me to verify the
exact source, tell me what to check and I will.

On amd_iommu=pgtbl_v2: I can run it, and I will report numbers rather than
impressions -- bytes re-read, wall time and the exact workload. Two constraints,
so you know what to expect:

  - It is a production machine, and testing means removing the iommu=pt
    workaround. I also assume a misdirected DMA can land in RAM belonging to
    unrelated processes, not just in the read buffer, so I will stop all
    services for the test rather than run it live.

  - My only quantified data point in translated mode is a single failure after
    768 GiB / 3h25m of verification reads. To honestly call a setting clean I
    would want on the order of 15 TB re-read, which is roughly a day. I will
    not report "this fixes it" on a short clean run.

A 7 TB integrity verification is currently running on this machine and I would
rather let it finish before rebooting. Given the above, would you still like the
pgtbl_v2 run, or is there a cheaper test that would tell you more? I am equally
happy to try libaio instead of io_uring, iommu.strict=1, or amd_iommu=off, in
whatever order is most useful to you.

Mario -- if the issue you were debugging internally has a comparable signature,
I would be glad to compare. I have the raw btrfs csum lines showing eleven
consecutive 4 KiB blocks returned in exact reverse order around a pivot, plus
full dmesg, kernel config, lspci -nnvv and IOMMU domain dumps for both the
failing and the working configuration. I can also collect whatever specific
diagnostics you want, including with a debug patch if you provide one.

Thanks,
Mikael Etienne
