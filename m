Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB60343D63;
	Thu,  7 May 2026 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142656; cv=none; b=sL16+QRq3XcP3R5LV+QBl6C/ueKM9l/voQQdcbJsBkd6W7bOsrECa0MjIHHHMEMJn9vftSWB5+LF6RS9mIxRTC68K2Hm/Mm/9EXd71Xx9SrEYhkGhZlXDIYVvHZHn5F7DnnSjyKvysTBBzHyeD5/YxeHxEyFTTuFEnjGnvmuM84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142656; c=relaxed/simple;
	bh=geHavgZaZIVCiukXpx1HhV2cBMxsNeuDV0MhY4hXAok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkACzJ4Jmud+P9/u4H0UiNIqUiDu8osaqg+CojVYN3xv1zXDsR77fH1gOhj3zKz5cnrmY68TaHEVSoRSonX6OD9ZHHpHltqjotJ1M5yJjsg66K9bWnQwBBDgWpq0bfRN+F4VLIySUCodcAll5R/kWjbQd9GwVn8IegxiQ/bcjKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mV3UTGk+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mV3UTGk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A86C2BCB2;
	Thu,  7 May 2026 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778142655;
	bh=geHavgZaZIVCiukXpx1HhV2cBMxsNeuDV0MhY4hXAok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mV3UTGk+MA0RxR/oH1m9bqdw82ETSU6Csmba+7UlV7HnQbDouCGG0lsP0O9hrxDC4
	 +kZMq6EAXIE0wF60O+9oTW5jtS1Q9sOXTDvL4GZPpJ870Or+Z68DSQKjIP32Uh2qYJ
	 5uX3vzsNVhrHcdR5Y1d+Ah7NBvXnwW8zPATQFH/9v7tNwrP7tMbFUiTky9sxsz+u6J
	 JCxdr9ZrtfMP29JmC2+Ujkfxw48wolgQNtl9eEn9Y0oNMN+jbFLS9p04+Yb25Au5Cb
	 rCMDJmaiAGP3fIao8i0g1x8Hlhbf+Zxni0uLiACCRCDwMWYl/RFDi0waJYCkFVDsek
	 wXYs+BL0UgMbw==
Date: Thu, 7 May 2026 10:30:50 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: An <an.m@mailbox.org>, Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	the arch/x86 maintainers <x86@kernel.org>,
	David Gow <david@davidgow.net>
Subject: Re: [Regression in 7.0] OLPC-XO-1.5 will not boot after commit
 157266edcc
Message-ID: <afxNuhoyMsl26tIy@gmail.com>
References: <f8566380-6a40-435a-bf8c-6c0e0999d434@mailbox.org>
 <7a0c8eec-2e97-4eaf-a8aa-f7e97da93908@mailbox.org>
 <00b05188-c352-42b9-888a-01e9bf00fb34@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00b05188-c352-42b9-888a-01e9bf00fb34@leemhuis.info>


* Thorsten Leemhuis <regressions@leemhuis.info> wrote:

> Lo! Looks like nothing happened since the report (please correct me if
> I'm wrong, it's easy to miss something). Adding a few more people and
> lists to the recipients of this reply, maybe that will things rolling.
>
> FWIW, the culprit seems to be 157266edcc5671 ("x86/boot/e820: Simplify
> append_e820_table() and remove restriction on single-entry tables")
> [v7.0-rc1] from Ingo.

Yeah, I missed the empty table case. :-/

> Therefore adding David Gow, who submitted a fix for the culprit -- but
> that didn't make it anywhere afaics, unless I'm missing something. For
> details see:
> https://lore.kernel.org/all/20260416065746.1896647-1-david@davidgow.net/

This fix is now queued up and should go upstream later this week:

  5772f6535227 ("x86/boot/e820: Re-enable BIOS fallback if e820 table is empty")

Thanks,

	Ingo
