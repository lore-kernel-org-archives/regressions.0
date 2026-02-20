Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE671BCA1C
	for <regressions@lists.linux.dev>; Fri, 20 Feb 2026 03:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771557248; cv=none; b=Tboi5g49Qvuu9aUpaAbVMjj04vsY0fqtJZO/Q+gGNMiaEQQgm8WmVQwHWhWRQRhTlvsfRx9HEq0+dQqJFRp6nI0hLYoZeVAUPNbv1yagOjBfxTes3rOOJBJaADmhVnRdrrnov/Ma6qiW6dWbUdKSl/8G94Es7SGhfcjZXfQYrPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771557248; c=relaxed/simple;
	bh=IVN7r0xifPkdyJXi/FO57cCcO7FR6lu7aoviGEL/TIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2wyb+XiRSYbABaPYxyNnvqtri4uVzU3k4ShATxULHRexejBf6uZV5VIlILiYmgnbpI3aum7x3urKjzAXBQ2K5TeLOZnnhE3M5yeO4l1Pp8zj+QvUC8gxeMUnc1/Nr5L1+EHwxE55g6Wxqcry0GBdPl30daoOBFZ3KUwv3ql1zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpBNfBQK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpBNfBQK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C18C4CEF7;
	Fri, 20 Feb 2026 03:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771557248;
	bh=IVN7r0xifPkdyJXi/FO57cCcO7FR6lu7aoviGEL/TIU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VpBNfBQKAQHyHko8NqxvqnEC46v6jYRrZ/qHUzqjgYvFiANO7oipkHFjHYM/o5SOS
	 6FLKeUTEGUZLJqlwnoNer2FNAYZ9CSBi6HfBp6LPhYkABJALwFVy+BHCJdqFhHt3yX
	 whh9PdXTTsUQhHBnDZpKHyfEi1A8tOHFX7AGuw/Wk8kc2cOCSB/FjhDKaysfYE2Vmt
	 UmtL6X6y/s13xee7y19AC1aNFxQLblg/ttFBli9JtpmMPBLzgfaB3Oiju+TUSdX+S9
	 Yz72ypRl+GS1QdUChjrsq5czaSNEAuXlEm10W37iTHjj/zl9hYJK77+jOkV9iA7/Er
	 2qlgOnYFO6WyA==
Message-ID: <c70fe261-7fb0-4af5-b755-f02b193c8c5f@kernel.org>
Date: Thu, 19 Feb 2026 21:14:05 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
To: Ivan Sergeev <ivan8215145640@gmail.com>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, regressions@lists.linux.dev,
 mwen@igalia.com, mario.limonciello@amd.com, alex.hung@amd.com,
 daniel.wheeler@amd.com, rodrigo.siqueira@amd.com, alexander.deucher@amd.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 huangalex409@gmail.com
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
 <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org>
 <DGJFVPAQJA15.378GMU7XZXLU@gmail.com> <DGJGDIRQWDG7.XHHKF6UQP0HG@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <DGJGDIRQWDG7.XHHKF6UQP0HG@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/19/26 9:02 PM, Ivan Sergeev wrote:
> On Fri Feb 20, 2026 at 5:38 AM MSK, Ivan Sergeev wrote:
>>
>> I've done the bisect using the v6.12.68 tag as good and v6.18.8 tag as bad
> 
> Sorry, those are not the tags I've used for the bisect. Before doing a
> bisect in git I first checked versions from 6.18 to 6.13, and could
> reproduce the issue in all of them, so after that I went for the git
> bisect between 6.12.68 and 6.13.6.

I'm wondering if you actually have a second regression manifesting 
similarly.

Can you check out at your bad commit and apply just 7f2b5237e313 at the 
bad commit?  Confirm that fixes it.

If it does, then redo your bisect applying 7f2b5237e313 where applicable.
