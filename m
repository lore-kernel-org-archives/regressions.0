Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC4523AD
	for <regressions@lists.linux.dev>; Sun,  4 Jun 2023 21:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37000C433EF;
	Sun,  4 Jun 2023 21:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685912936;
	bh=JgaWyf33610UGwH/8u5/mQKfw1d7qwCvYowPof1VTXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwFBEVe4y+3KnsDTa7kSuF5SpMT+jG5bQtdco6Y/2nP9SBXXNvP9ueNRnyRjjOy5C
	 4BZr9m6u2lglRSt/8nYh7yJ5Nb3PAfpB4Nz8AerbtyFdLkVsHrLigLxt8NgUdgF1bm
	 ChvaZDWy8UQnusVnhDcvmvCF2L/XnFJGNjtm4WNNWQbNckWBLV9b5mclG8CC4J2x4Y
	 2D2T+YWqSzniXA7rkqamCRRsbMSqSP30wBh9YtmS/BWnA/oAJ7vrsLNOP6QCWtec1I
	 UxWz0WcP1uHfMcJix00L0wIKRk2jO9mrMZkFfF40RvIXhiuSP04CGJYV1glIaATn8V
	 4BWCuBbHtZR9w==
Date: Sun, 4 Jun 2023 17:08:54 -0400
From: Sasha Levin <sashal@kernel.org>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Cc: stable@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: amdgpu regression in 6.3.4
Message-ID: <ZHz9ZjxhrH+ZiYL9@sashalap>
References: <4936a11f-f4f0-7559-a43e-90098aa68c90@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4936a11f-f4f0-7559-a43e-90098aa68c90@amd.com>

On Fri, Jun 02, 2023 at 08:09:56PM -0500, Limonciello, Mario wrote:
>Hi,
>
>Sasha's auto-selection backported:
>
>commit f3f8f16b10f8 ("drm/amd/display: enable DPG when disabling plane 
>for phantom pipe") from 6.4 into 6.3.y as
>commit ef6c86d067b4 ("drm/amd/display: enable DPG when disabling plane 
>for phantom pipe")
>
>This was bisected down to have caused a regression in both 6.3.4 and 6.3.5:
>
>Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2581
>
>The problematic behavior doesn't occur in 6.4-rc4.
>
>This is confirmed to fixed on 6.3.y by backporting an additional commit:
>
>82a10aff9428 ("drm/amd/display: Only wait for blank completion if OTG 
>active")||
>
>Can you please backport this to 6.3.y to fix this regression?

I'll grab it, thanks!

-- 
Thanks,
Sasha
