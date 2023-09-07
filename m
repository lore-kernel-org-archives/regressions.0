Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADC6566C
	for <regressions@lists.linux.dev>; Thu,  7 Sep 2023 10:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17127C116A6;
	Thu,  7 Sep 2023 10:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694081852;
	bh=D0YOmx6OmWNMjeQsTguLfhAxPqjOL7Fqu32QbhYTxuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xFnH3zyxOjdc/5PApRBOvRxsczKfMFO53DMNu+7ggCtE6+fkwfmdo2vpIReLjKM8r
	 bgL7WDhHKggA/SmDHlNcKXhkBLk2rDDDpbTlwNGUXxPJIeoRDA9qJNTMHIQGWFsWt+
	 q+YvS982eyZA9HKSi9Hwwfw4iM/RNd1MnFaKWiiE=
Date: Thu, 7 Sep 2023 11:17:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Consider picking up "tpm: Enable hwrng only for Pluton on AMD
 CPUs" rather sooner than later
Message-ID: <2023090722-molehill-ranking-65e8@gregkh>
References: <a8d206b6-d1d8-4c9a-b82c-724c2def0491@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8d206b6-d1d8-4c9a-b82c-724c2def0491@leemhuis.info>

On Wed, Sep 06, 2023 at 01:21:07PM +0200, Thorsten Leemhuis wrote:
> Hi stable team, JFYI, the recently mainline commit 8f7f35e5aa6f21 ("tpm:
> Enable hwrng only for Pluton on AMD CPUs") from Jarkko contains a stable
> tag, but it might be worth picking up rather sooner than later, as it
> fixes a regression that seems to annoy quite a few users of 6.1.y, 6.4.y
> and 6.5; that's why at least Fedora is already working on picking the
> fix up ahead of the stable-tree.

Now queued up, thanks.

greg k-h
