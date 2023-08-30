Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738EF46A8
	for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 11:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74045C433C7;
	Wed, 30 Aug 2023 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693395104;
	bh=I3QUcjvGQNK/WN89qE62mUZVvbzh+sWhFO8OhwQe9X8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RqVB98BtcFRECsHjf/CiUJ0L+JtoTi59vAb6U8d2YYLwJ231NZIjyA7npgBQJAX+z
	 egaJ/xuBPVb5pFWPpdsnbrE6deMEAJFAZnO3hv0rbHqpELBHeDWrCSgLl+mq2shwYp
	 cp89hgjpa+AEKmITt/z5pYxu4CtjtGeQmjAeziRaqbpFUVoisXX+zf9nPAJZhawVRs
	 LSU7v1ESMqoq6VQ5BRdLt6j6ndZVc5jW82b9o/9bXd3e+uTQpEzwDaav0YSSOvVAt/
	 xBdzUgx+j1YjBcGgECYyJ80/0lk513eTmFp2cLf2w1Eq4hyp4MMZNUQTEsslS7ue5m
	 rCRv6PRhC+2Kg==
From: Kalle Valo <kvalo@kernel.org>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,  Bjorn Helgaas
 <bhelgaas@google.com>,  Linux regressions mailing list
 <regressions@lists.linux.dev>,  linux-pci@vger.kernel.org,
  linux-kernel@vger.kernel.org,  ath11k@lists.infradead.org
Subject: Re: [regression v6.5-rc1] PCI: comm "swapper/0" leaking memory
References: <878r9sga1t.fsf@kernel.org>
	<8a737241-f216-169a-8bd3-d0832439b99e@leemhuis.info>
Date: Wed, 30 Aug 2023 14:31:40 +0300
In-Reply-To: <8a737241-f216-169a-8bd3-d0832439b99e@leemhuis.info> (Linux
	regression tracking's message of "Wed, 30 Aug 2023 11:55:47 +0200")
Message-ID: <874jkgg40z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Linux regression tracking (Thorsten Leemhuis)"
<regressions@leemhuis.info> writes:

> Hi, Thorsten here, the Linux kernel's regression tracker. Partially
> top-posting for once, to make this easily accessible to everyone.
>
> Thx for the report. To quote one aspect:
>
>> v6.4 has no leaks.
>
> I pretty sure you mean stock 6.4 here. But FWIW, the culprit was
> backported to 6.4.y and 6.1.y, so they latest versions might be affected
> as well.

Yes, I mean v6.4 release tagged by Linus:

6995e2de6891 Linux 6.4

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
