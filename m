Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B984756B5;
	Sun,  4 Oct 2026 17:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791136423; cv=none; b=mPGBWbTB1LPJM58S0ZLXZMBc2hnkBxCaAQ/JK5ZDqd+oi58YVR/+4G9DcYIdnlEWSFTi/raz3i5icf+/pSZ8KbH3lsSThhg+M97Vwupb+XP1wrD/3/+fqhewRhsprN9xblO1801DzQMi2KMTyMXDye22jLaHd/5ZXGZuh0Pqr8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791136423; c=relaxed/simple;
	bh=yl8WttfpIX38MosSJb3rVSyrB67EpdYSZFKFMwwpgFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LmETJJ7fpZ79SbmJVl5H4YEhJ8ccxZIbuifQLx8M53B963KHeq2kduHbyukH3/TFs96agoIQV5WVXQnc0wurfZTZo3XRt834f3nyV0UsqjzmapV12yyqbNvEaNnW6FQOUh4tQSbqYdbSknxVJ62y6aGE8u307TKdwNrrM4kVdEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QoiadJJT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QoiadJJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1167B1F000FF;
	Sun,  4 Oct 2026 17:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791136416;
	bh=dW2d3LGbBGSadjanQBD6Rhc29aMig4rkrP/cDF4hCPM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QoiadJJTHbytHLLUgcMMJDU2oFapVhRXRlzl12k8kd8u1xmwsp91V3Vv5KdQJ8/8n
	 SRnfB2A4IIMfYR5JpyY29iU+f88a4kaHKDpHr3HlX+Y/2Kdh/cEUvZFKyDjeQp+9sR
	 fdXwZkKRN5on7IdkIwshDYEf/pgjqQW6kScfNW/Yk3BT4/s0+KDfaEPd8WKRNmZTkn
	 K3NccYEeufnFJV7FH2iw27/6wrnSQPDhBnGg9gmyv2S6+421Jkv8hqxUWvc+lTzBjn
	 w8rCq9In5zLZUrPSnFVq5PLTJPIxBMhg3QqnjJDetBIE2lvyL1LhuWZr5G5+6XRRhl
	 JkK1N+yfcGN7A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Chris Bainbridge <chris.bainbridge@canonical.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Mike Rapoport <rppt@kernel.org>,
  Pasha Tatashin <pasha.tatashin@soleen.com>,  Jason Miu
 <jasonmiu@google.com>,  Alexander Graf <graf@amazon.com>,  Ran Xiaokai
 <ran.xiaokai@zte.com.cn>,  regressions@lists.linux.dev,
  linux-kernel@vger.kernel.org,  kexec@lists.infradead.org,
  linux-mm@kvack.org,  =?utf-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?=
 <mclapinski@google.com>
Subject: Re: [BUG] KHO handover hangs when memmap reserves PMEM
In-Reply-To: <asJc1GIBbCJ26akS@px13> (Chris Bainbridge's message of "Sun, 4
	Oct 2026 16:09:00 +0100")
References: <asE0R_f2r2TL-3Sy@px13> <2vxzcxtplh4i.fsf@kernel.org>
	<asJc1GIBbCJ26akS@px13>
Date: Sun, 04 Oct 2026 19:53:32 +0200
Message-ID: <2vxzzewtjqsj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Oct 04 2026, Chris Bainbridge wrote:

> On Sun, Oct 04, 2026 at 03:39:25PM +0200, Pratyush Yadav wrote:
>> 
>> Just to confirm, the first kernel boots without memmap= right?
>
> Yes.
>
>> I think the main problem is that the radix tree pages can be anywhere in
>> memory. So on the first kernel, they can land in an area that the second
>> kernel's memmap= reserves. So kho_memory_init() might end up using
>> memory that memmap= reserved. I'm not sure why exactly the next kernel
>> doesn't produce any output, but IIRC memmap= memory is not mapped to the
>> direct map, so accessing those pages likely causes a page fault.
>
> That's correct, kho_memory_init() page faults. It happens before the
> serial console is available, so there is no output.

Yeah, then I think you need an extra kexec with KHO off to enable
memmap=. Or I guess hot-unplug the memory you'd like to memmap= early on
first boot, which should make sure no radix tree pages land there.

Apart from that, I don't have any good ideas to properly solve this
problem.

-- 
Regards,
Pratyush Yadav
