Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DA35CB8
	for <regressions@lists.linux.dev>; Mon, 17 Jul 2023 07:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E2DC433C9;
	Mon, 17 Jul 2023 07:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689580155;
	bh=waKWJVOAVBelCCI1mB4poaxnZoLxRarS05iTbEu+fGg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ETvDL7REf0/QLPjSciqioJlqT1+t33+n0MsHYt3ZS5nlqHjalFVSULyueWDSepJDZ
	 a46DVAA3dKgwxAjvszYB+hLxtPJD1X/rgMNPtfuf5hdqn2jsiKrzSrJfDhNHwRSJg6
	 V0Uh9d0cJBX0uREL+nV3SHHXKD/coZHG4MNLn11h9ZkEKXvFzKsjo+zSsKHvYkdH3v
	 fHlC6qyQk6G2/u5DWApyL3KQk622YrhFo0WZP/Mibs0WahAhiJlvWHs+726a2EyFVz
	 3ura9Lcwiw7xZvHtGYlm8Xcl0CQ3PuZi0qM9x//tPcN/a7n49IXmpXwBaKsRgV32Qe
	 xgne2JMBU4bAQ==
Message-ID: <895ed8ae-e93f-b296-330e-356cda698de2@kernel.org>
Date: Mon, 17 Jul 2023 09:49:09 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH docs] docs: maintainer: document expectations of small
 time maintainers
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Jakub Kicinski <kuba@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 Mark Brown <broonie@kernel.org>
References: <20230713223432.1501133-1-kuba@kernel.org>
 <6f1014cd-f8c5-f935-dcc7-4f5a6b85e473@kernel.org>
 <20230714101028.337fb39a@kernel.org>
 <bb8c6476-283c-3bc6-710b-5a8602ccd40e@leemhuis.info>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <bb8c6476-283c-3bc6-710b-5a8602ccd40e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2023 12:31, Linux regression tracking (Thorsten Leemhuis) wrote:
> [CCing other people in the thread]
> How about something like this:
> 
> ```
> Bug reports
> -----------
> 
> Maintainers must ensure severe problems in their code reported to them
> are resolved in a timely manner: security vulnerabilities, regressions,
> compilation errors, data loss, kernel crashes, and bugs of similar scope.
> 
> Maintainers furthermore should respond to reports about other kind of
> bugs as well, if the report is of reasonable quality or indicates a
> problem that might be severe -- especially if they have *Supported*
> status of the codebase in the MAINTAINERS file.

I like mentioning the "Supported" part. We should be a bit more
understanding to all folks who are not paid to do this.

Best regards,
Krzysztof

