Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F36FB7
	for <regressions@lists.linux.dev>; Thu, 23 Feb 2023 19:49:09 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E3F19784;
	Thu, 23 Feb 2023 19:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E3F19784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1677181743; bh=6i117taZyn95xl8Lva1hLaF9JQZ4RY43yrhHYMVOJVo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rS63RNBIq02K0ix1bcV9VjBlVS3NKg/2GS7QeEh/5zQ3pPa9s8tIYI1BRCGFi+fB7
	 WizdBlHBzomqbgztijn6M4/tB1OciAy4J7l3glJ3ixTBO1EyTjA0M6aGQnXJ4lwXle
	 wR8RAdNQrJGprxfMvSTVVBainzMjK596SZ2T/Eflbuhpg8szAatj66/ZJTBzOCxAFu
	 pR0G3MawP7A7Mtl0TCeq63caVJeE+qFHYJrgOyUYDqxASDECNVCBhP13L0xHqfLdO/
	 a8434ODy3wuM2ZHod+lUWEfAUj1D6qDpPdGC09zrg0CNqvnPlE6nmk7y+5JBvifhB5
	 Dt0DViVbtiD0w==
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v1] docs: recommend using Link: whenever using Reported-by:
In-Reply-To: <9a07ec640d809723492f8ade4f54705914e80419.1676369564.git.linux@leemhuis.info>
References: <9a07ec640d809723492f8ade4f54705914e80419.1676369564.git.linux@leemhuis.info>
Date: Thu, 23 Feb 2023 12:49:02 -0700
Message-ID: <87ttzc40y9.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Encourage developers to place Link: tag pointing to the report when they
> are using Reported-by: tags. Those links are often extremely useful for
> any code archaeologist that wants to know more about the backstory of a
> change than the commit message provides. That includes maintainers
> higher up in the patch-flow hierarchy, which is why Linus asks
> developers to add such links [1, 2, 3]. To quote [1]:

Applied, thanks.

jon
