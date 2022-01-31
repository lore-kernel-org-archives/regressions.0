Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063E13FE3
	for <regressions@lists.linux.dev>; Mon, 31 Jan 2022 22:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F33C340E8;
	Mon, 31 Jan 2022 22:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1643668755;
	bh=Q2ZEQqdLwRPhSxsGyaxZ+JOpmXVNnMzJAHIcJOnnDLU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kzue/aCCq9ObTiYIuAjwKTLXibXh5MxhcCj2FpkIONcBP+jWsczIf6y29zwyW1xU+
	 RMDnDd+FKFwR5i+54r0oEVsnZ/ss2R42UaDhWCK489xnzu+Vgg2FLlryWI3v5JZ5eN
	 GkPe5G+qMV8iMgfppVXqjX9H2FQKqjxgLMf9c0jI=
Date: Mon, 31 Jan 2022 14:39:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Chen Wandun <chenwandun@huawei.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 guillaume.tucker@collabora.com, regressions@lists.linux.dev, Oscar Salvador
 <osalvador@suse.de>
Subject: Re: [PATCH] Revert
 "mm/page_isolation: unset migratetype directly for non Buddy page"
Message-Id: <20220131143914.4cce43a15c2d9a7d53582659@linux-foundation.org>
In-Reply-To: <338bde65-5e1c-4e23-b4f2-671819c637cc@leemhuis.info>
References: <20220117142712.3967624-1-chenwandun@huawei.com>
	<b1966d11-e874-c71e-d14f-c0c88ace297e@suse.cz>
	<c0b74f54-c39a-51f7-08f8-701e9af94e56@huawei.com>
	<338bde65-5e1c-4e23-b4f2-671819c637cc@leemhuis.info>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Jan 2022 10:24:43 +0100 Thorsten Leemhuis <regressions@leemhuis.info> wrote:

> Andrew, I don't see this patch in the list of changes you sent to Linus
> yesterday. Shouldn't it be in there due to above reason alone? And there
> is another reason: it seems to be an issue people actually hit, as
> Guenter mentioned in this thread. It thus complicates things for those
> that want to help testing pre-releases.

I prefer to give fixes some time in linux-next before upstreaming them.
At least a day, worst case.  So I have this patch in this week's pile.
