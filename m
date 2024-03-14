Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com [52.119.213.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D047441E
	for <regressions@lists.linux.dev>; Thu, 14 Mar 2024 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710434605; cv=none; b=NLnZWYPkN8Vuu6hKix6D/AiqDNNi8BJmDbCijPsOMTZdRp+DlL3PlH5bOqEZjj4jBp6qog/nhruOAjKJOyDQfYbywIANHghrLi7QSYjSB8rvme7xtmuzkDjb0nHhiLtQtchgdi50rVOEDO8dA9BGykyiHYVPCFFikPZnzkSSqLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710434605; c=relaxed/simple;
	bh=F+jWqDGGfOIf2dwHhOKxk8w5QAp7Gn2ZWLqVone/E8E=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ozXOlURmV+gZ1Av9v0S0FAyJoalkbKt2InUs2GLUDwi+l/X6G2KcLidRs/lrKFRN1bhP2XCSNL7AgzXFaZMDA5JSNOXnAY1zhl0qvtm5PcR9aYOsm1UncZ0+SL76d7rIhRN5wY0GE1zF+VRmemQShzPseeG03kRPzksmuTAR8Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=MTFwXwn3; arc=none smtp.client-ip=52.119.213.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="MTFwXwn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1710434605; x=1741970605;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=jQra6uXIBNcg4Dam997blH33D3Sik7pC44xNHzeQhaE=;
  b=MTFwXwn3u6IAMJLWES0e2AD74eIGP4Lw8Yf3a4kigCqoFKm9K4H5IDG/
   lJdNjSs01NoLDL/T7f3fgYE7gT4pnMsMQiHOaOkLyewMuUAabCoir00rj
   sbG087MvWrgyu5FfQOaZJNRNuVXZQwvjPPMp5FXOjPJbXcWFat5w1Dg1l
   w=;
X-IronPort-AV: E=Sophos;i="6.07,125,1708387200"; 
   d="scan'208";a="191615721"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 16:43:22 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.38.20:60788]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.10:2525] with esmtp (Farcaster)
 id 83b776e8-afb3-4100-a22c-3976d1e92cfb; Thu, 14 Mar 2024 16:43:20 +0000 (UTC)
X-Farcaster-Flow-ID: 83b776e8-afb3-4100-a22c-3976d1e92cfb
Received: from EX19EXOUWA002.ant.amazon.com (10.250.64.216) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 14 Mar 2024 16:43:20 +0000
Received: from EX19MTAUWA001.ant.amazon.com (10.250.64.218) by
 EX19EXOUWA002.ant.amazon.com (10.250.64.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 14 Mar 2024 16:43:20 +0000
Received: from dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com (10.15.1.225)
 by mail-relay.amazon.com (10.250.64.204) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 14 Mar 2024 16:43:19 +0000
Received: by dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com (Postfix, from userid 23907357)
	id 77FBB64B4; Thu, 14 Mar 2024 17:43:19 +0100 (CET)
From: Mahmoud Adam <mngyadam@amazon.com>
To: Borislav Petkov <bp@alien8.de>
CC: <peterz@infradead.org>, <tglx@linutronix.de>,
	<gregkh@linuxfoundation.org>, <regressions@lists.linux.dev>, David Kaplan
	<David.Kaplan@amd.com>
Subject: Re: Regression caused by 'x86/returnthunk: Allow different return
 thunks'
In-Reply-To: <20240314143848.GAZfML-Bbk3_Nxyc0c@fat_crate.local> (Borislav
	Petkov's message of "Thu, 14 Mar 2024 15:38:48 +0100")
References: <lrkyq5xxrz0gg.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
	<20240314143848.GAZfML-Bbk3_Nxyc0c@fat_crate.local>
Date: Thu, 14 Mar 2024 17:43:19 +0100
Message-ID: <lrkyqle6kydaw.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Borislav Petkov <bp@alien8.de> writes:

> On Tue, Mar 12, 2024 at 08:58:39PM +0100, Mahmoud Adam wrote:
>>  We've seen ~35% regression on fio benchamrk on AMD caused by these
>> commits:
>> `
>> 545a94ffc29a4 * x86/alternative: Make custom return thunk unconditional
>> b012dcf39d9e7 * Revert "x86/alternative: Make custom return thunk unconditional"
>> 1221b8ea25cc8 * x86/returnthunk: Allow different return thunks
>> `
>> the finding and bisection was done on v6.1, but the regression is
>> already seen on the new rebases of other stable kernel 5.10 & 5.15 that
>> have the same patches.
>> 
>> the following exact fio command that sees this regression:
>> 
>> fio --time_based --name=benchmark --size=50G --runtime=60
>> --filename=$device --ioengine=psync --randrepeat=0 --iodepth=1
>> --fsync=64 --invalidate=1 --verify=0 --verify_fatal=0 --blocksize=4k
>> --group_reporting --rw=randwrite --numjobs=1
>> 
>> note: the regression is seen even with retbleed=off and also with spectre_v2=off
>
> Say, out of curiosity, how exactly are you running the fio benchmark?
>
> Baremetal, what CPU, kernel, etc?

Virtual, AMD EPYC 7002 series processors, v6.1.80 kernel
More specifically: this was run on C5ad EC2 instance[1], device used
for benchmarking was the attached ephemeral NVMe.

[1] https://aws.amazon.com/ec2/instance-types/c5/

-MNAdam

