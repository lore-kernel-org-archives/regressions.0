Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DB8329396;
	Mon, 29 Dec 2025 15:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767022827; cv=none; b=jwhRYzz86vHS20NDMQbT0ct7vbQJCqM+ugJ8Xw0+cZvG8Glwp7sK1ybg2oWNb5J9mrOQ6pbX1s3I/Ebk/Z/7y28qKJamIX9N4kJg+xUJynDkat5n55Sv2XGjMZ2Xj1eiTz1Uu8BM2CaKP1oiVCA42iHZsipICh3UFSWONts/ppA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767022827; c=relaxed/simple;
	bh=3Z8D+V4bPrmjRWPUc4/T1IQEppsi7x5xJn5ti8fdgl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL3b6eEWI92P3LYxSr/cKjFda6/VOqH993EudWv+KE6/0iTeMNV0Joi0ukO+d6D3g8XtCj+I87rYIfZzBT33RHDn2virZpn3dHDxoGfqTzqbySleMn6Ci21rPukIwsI0+rkAV9HO8bnuO+f8SgZl/7NifwAGQrVF0HTm7SYnDt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GZCacrrh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GZCacrrh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17530C16AAE;
	Mon, 29 Dec 2025 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767022826;
	bh=3Z8D+V4bPrmjRWPUc4/T1IQEppsi7x5xJn5ti8fdgl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GZCacrrhB9ZrtVqsp0fEzkyOnBtbzWRuk3bIfJCuy4ov0KB0u3oW8d+gN0V7FgJdr
	 sl/qX1LQA758vQlCxGowQmh5f5AQEmK+WVMIgD0j/uIoUalM0RS2aGS6gN4Y6yZGm3
	 Bess4oeXRYbcZyzNRG/9qQW32wZdWooJTNoJDG9Y=
Date: Mon, 29 Dec 2025 16:40:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: stable@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	alexander.deucher@amd.com, ivan.lipski@amd.com, Jerry.Zuo@amd.com,
	bugs@lists.linux.dev, regressions@lists.linux.dev,
	daniel.wheeler@amd.com,
	Mario Limonciello <mario.limonciello@amd.com>,
	=?iso-8859-1?Q?P=E9ter?= Bohner <peter.bohner@student.kit.edu>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	aurabindo.pillai@amd.com
Subject: Re: [6.12.61 lts] [amdgpu]: regression: broken multi-monitor USB4
 dock on Ryzen 7840U
Message-ID: <2025122914-province-vividly-fea1@gregkh>
References: <9444c2d3-2aaf-4982-9f75-23dc814c3885@student.kit.edu>
 <ea735f1a-04c3-42dc-9e4c-4dc26659834f@oracle.com>
 <b1b8fc3b-6e80-403b-a1a0-726cc935fd2e@student.kit.edu>
 <bfb82a48-ebe3-4dc0-97e2-7cbf9d1e84ed@oracle.com>
 <7817ae7c-72d3-470d-b043-51bcfbee31b1@student.kit.edu>
 <d5664e24-71a1-4d46-96ad-979b15f97df9@student.kit.edu>
 <ee6e0b89-c3d0-4579-9c26-a9a980775e55@leemhuis.info>
 <24e5cb3b-73dd-43d3-9d35-b29d1d18340a@amd.com>
 <c7bec14b-ee8b-448f-a7ad-a741ff974ea9@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7bec14b-ee8b-448f-a7ad-a741ff974ea9@leemhuis.info>

On Tue, Dec 16, 2025 at 12:14:23PM +0100, Thorsten Leemhuis wrote:
> Greg, Sasha, could you please pick up 72e24456a54fe0 ("Revert
> "drm/amd/display: Fix pbn to kbps Conversion"") [v6.19-rc1] for 6.12.y
> and 6.17.y (if there is another 6.17.y version), as it fixes a a
> regression there? See below for details.
> 
> Note, the mentioned patch contains "Cc:stable@vger.kernel.org # 6.17+",
> but needs to go to 6.12.y, too: the culprit was backported there and
> causes problems there, too.


Now queued up, thanks.

greg k-h
