Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAB21B85
	for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 20:05:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 809255BF;
	Thu, 24 Feb 2022 19:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 809255BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1645732684; bh=HVw2UezRrT65n15xUbRuzSJs4qGya2Y7XVmPXK4ePUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J24vHSoqtKXTkX0XKHbreOJXX8M6T4R5iQaMTNdBXNZInKPXCq81/TLB5bQyIEdQa
	 8C3depVw8nYGm9nvvfdklL2yqoOmsC4wnKxah01KJLoPyiJOkAqktCzEKVJtQQjanX
	 D4jFNafOnvg21idha2Jfi86MrJnGYrqduUE85BfKHvJ1JQtgTWn3vQdK1HF4pXPSB1
	 lwkEm6OAC9J2XxFXTnjpl0rto1DYPTNaKCEWqzm9EkBIbRYYocha37oSv/x2YweUlm
	 5vaTf8szj9YR5t9j5VjAFmbUyHIm8Rd2rQU5Lo6lKQqVwl/XNC2EzjeuuoeGGUFPqK
	 bIxBCtRJha47Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, linux-doc@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: workflows@vger.kernel.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 regressions@lists.linux.dev, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH v5 0/3] docs: add two texts covering regressions
In-Reply-To: <cover.1644994117.git.linux@leemhuis.info>
References: <cover.1644994117.git.linux@leemhuis.info>
Date: Thu, 24 Feb 2022 12:58:03 -0700
Message-ID: <871qzskpf8.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> "We don't cause regressions" might be the first rule of Linux kernel
> development, but it and other aspects of regressions nevertheless are hardly
> described in the Linux kernel's documentation. The following patches change
> this by creating two documents dedicated to the topic.
>
> The second patch could easily be folded into the first one, but was kept
> separate, as it might be a bit controversial. This also allows the patch
> description to explain some backgrounds for this part of the document.
> Additionally, ACKs and Reviewed-by tags can be collected separately this way.

Hearing no objections, I have applied this set, thanks.

jon
