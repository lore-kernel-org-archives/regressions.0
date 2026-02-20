Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A403322A
	for <regressions@lists.linux.dev>; Fri, 20 Feb 2026 02:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771554384; cv=none; b=FigZ04rjzEYMn5spmSbyfTuG/+S+IpK3PbdvEO07wpa5bhcAqr2MG6e8XrsodEmIEVjbl1ZZS4i27AIsNMLj7Tv4Bp/Oip77r5tRjLVvzmptFcO4864vQZHzHxH9/r+TUCbJ6531rClQHlVBjouPtkLxNmKEBj0VufHBNaTmeYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771554384; c=relaxed/simple;
	bh=DHcpy+3t3n0jZl79hCY90lUh34so7m5K6sHuh95C6ME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhlqkBBgWnk9SGxXPO9zHuZgAEsqzzv97tz8p2lCdnpJKwVDTlj4u16/8ncAY7ruTYzXntmwWC+AbpqIhjLrUN3RBXuU/EahHzlsHiFlyBSWNjv81dVoJrNQzWPfbbs4atnJav8cjLqpAp47zbXj1zybgxTC8Vi6CzeB9vJAexk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgTnpWrM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgTnpWrM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855D4C4CEF7;
	Fri, 20 Feb 2026 02:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771554383;
	bh=DHcpy+3t3n0jZl79hCY90lUh34so7m5K6sHuh95C6ME=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pgTnpWrMHEyOP0K4FUeE+bfKRi9mMZyMT44jfyK8GIBj4oFHZy7Ys1D/ZlnYljqAf
	 VfPJcNaduC1ScCPsoU0isRhjhITHsQj1U7ZqLtH6UoKTzq2QDHDxCbWUS0cdg+MTFQ
	 pmrCwKNSA6zmwMsI0YfTwM9Uhz13dfO6RGMXvErGzpbv7Yq9d2jOgfcDVuwoJUDyhU
	 pAO8HAjuIlZnVTB5hX8BiZDQ8jURsN9uQPVEkLkX66FRoH/6iin1rnuu5cojxWEYMR
	 bTsPmF58/ZnWlr1zW5Jcg9MDbVbPBqY7Yo5rXZemk1jEBZb6VN9iu9ASz4h9h4RodU
	 ul6jvXFEjAc+A==
Message-ID: <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org>
Date: Thu, 19 Feb 2026 20:26:21 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
To: John The Cooling Fan <ivan8215145640@gmail.com>,
 amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, regressions@lists.linux.dev,
 mwen@igalia.com, mario.limonciello@amd.com, alex.hung@amd.com,
 daniel.wheeler@amd.com, rodrigo.siqueira@amd.com, alexander.deucher@amd.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 huangalex409@gmail.com
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/19/26 4:33 PM, John The Cooling Fan wrote:
> Noticed a regression with VRR after updating the kernel. My main
> monitor's VRR stopped being recognized, I was no longer able to enable
> it in my desktop environment settings and
> /sys/kernel/debug/dri/0/DP-1/vrr_range showed a range of 0 to 0. I did
> a bisect on the linux kernel git tree, and found that the commit
> introducing this issue is 0159f88a99c9f5722dbe52ac42faf3446f371dea.
> 
> The monitor is connected via DisplayPort, no converters as far as I
> know. The GPU in use is AMD Radeon RX 6700XT. There is another
> monitor, connected over HDMI and it has VRR working in all the
> versions I've tested. Attached the DisplayPort monitor's edid copied
> from sysfs.
> 
> #regzbot introduced: 0159f88a99c9f5722dbe52ac42faf3446f371dea

Can you please share your bisect log?  There was a regression from that 
commit but it was already fixed a long time back.

commit 7f2b5237e313 ("drm/amd/display: restore invalid MSA timing check 
for freesync")

