Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FA03515CD;
	Sat, 10 Oct 2026 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639937; cv=none; b=JVdjl3pfDqaWpbE0gNPkH3mIwLMdUM/Pb5VXPUCS8f7gV+pHFrHQdNtj1/peCZz/BEOkh0lsf/orKUrcX9USW3UPSMuiMHApbiPMim+yXyV4M5/tn8YX+yYooM+ZMlcMj6RjPjDDODHJpov5DlktBCKruRwbWUuUMbbHLPsRmB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639937; c=relaxed/simple;
	bh=ym2Zzvw3LJt6VG0b/1J0g+H6sSy5Icu1B9BdR7mkcc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpTgPqhNmMob378Ca/2MtfHBOMa/nRcXI6+UPuLCpERCoM2tAfBiLj1wKyOa7aBORVB7nQWJ9PYBJvYXKRFxihoZIAdo1WPQ2vFtc2Fu0QgasqrjqUBkoZSaUIAoNdn/vd0VKMVMwz/x0Wj9TojSZUpT9WegcXTE+f+J65tgbUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cxf1u295; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cxf1u295"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8431F000FF;
	Sat, 10 Oct 2026 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791639936;
	bh=4dN/mCtTBXYJ2pasLy+uq66Ba+EYdlz12Wgok4NPMsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cxf1u295b8s5o6wBwMxRCtC68LIhvpfDQqaL/e77DWMfI9ZK+osFTgv4QwVRzbjea
	 rSD/Xihfr8DSYO3ofgcl1EUDBnHwlUAPws3SIBR0UgXr/Pgo0Bsn+Zb8w3BjPIvUJC
	 r2MXaFpLIQKl9T7zlQTTh6Ejbpr9MnnUEiuwBe/qyplxvtNDzQaUljX/t47myoTDlg
	 oabkjxIlyxRxBLVYtOqOwU3qsayJwowErGAv9knMu0mQGjs/ptXr3V13PH2aeaal2S
	 b47pU13NZN65n2F6qCoiBEJXac4nBfY789q/LfG13KA6RZUMc7E045foC0epMJEyvP
	 GbR/4NT25MTrw==
Date: Sat, 10 Oct 2026 09:45:24 -0400
From: Sasha Levin <sashal@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	broonie@kernel.org, tytso@mit.edu,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH 2/2] agents: add a skill to determine Fixes tags
Message-ID: <aspBdHTZxEVA8Cbl@laps>
References: <cover.1791499378.git.sashal@kernel.org>
 <7fa126fd22b4449cf63a7045f7cd959e106fac87.1791499378.git.sashal@kernel.org>
 <c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info>
 <20261010063228-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261010063228-mutt-send-email-mst@kernel.org>

On Sat, Oct 10, 2026 at 06:33:05AM -0400, Michael S. Tsirkin wrote:
>On Sat, Oct 10, 2026 at 11:40:56AM +0200, Thorsten Leemhuis wrote:
>> On 10/9/26 00:54, Sasha Levin wrote:
>> >
>> > +A ``Fixes:`` tag identifies the commit that introduced the bug being fixed. [...]
>>
>> Sorry for partly hijacking this, but it seems appropriate while we are
>> at it:
>>
>> What exactly is the right commit to specify when it comes to a
>> regression caused by a change that exposed a way older bug? The change
>> that exposed it? The change that introduced it in the first place? Both?
>> I'd tend to "both", but I guess some people might consider this as too
>> noisy.
>>
>> I've seen occasional discussions about this and our docs for humans are
>> a bit vague here:
>>
>> Documentation/process/submitting-patches.rst says:
>> ""If your patch fixes a bug in a specific commit, e.g. you found an
>> issue using git bisect, please use the ‘Fixes:’ tag with at least the
>> first 12 characters of the SHA-1 ID, and the one line summary.
>> [...]
>> A Fixes: tag indicates that the patch fixes a bug in a previous commit.
>> It is used to make it easy to determine where an issue originated""
>>
>> And Documentation/process/5.Posting.rst says:
>> ""One tag is used to refer to earlier commits which introduced problems
>> fixed by the patch:""
>>
>> Ciao, Thorsten
>
>I'd say the one exposed it. this way it is useful to answer
>the question "do i need this fix".

I'd suggest the original commit that introduced the issue, or if you really
want to - add two Fixes: tags.

My reasoning is that if there were holes around the reachability of the issue
in the past, we want to land the fix on all relevant trees, rather than just
the ones affected by the most recent case that enabled it to happen.

For example, let's say an issue was introduced in v6.5 and was reachable by one
codepath. Later, in v6.7, we refactored some code and made is issue benign by
removing the only codepath that could reach it. Even later, a new commit in
v7.0 made the issue reachable again.

If our Fixes: tag points to the v7.0 re-introduction, then we will miss the
backport to the v6.6 tree.

-- 
Thanks,
Sasha
