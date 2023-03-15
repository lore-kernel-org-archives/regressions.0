Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A3623A3
	for <regressions@lists.linux.dev>; Wed, 15 Mar 2023 07:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9038C433D2;
	Wed, 15 Mar 2023 07:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678865187;
	bh=ooGXeeU67h9rFHAlA9IP9yPOlqS+KZXYPJVjLubgYdM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d3+PBxmjoOVQDEyuQQLa8zbi0FGJCll3Kn2tOPPg0NB8yqQJvMFmFnQaAPIk2wdJT
	 7HgXsgAjmi8ZuxuOpyT+yIH+mdxx87p5mg3P/80emymMxBSuIiVc25pkLgzX3xsVZk
	 Ta18JP14N1NasRkEk/a6U6rp0bs4l0FnQ4tZ79udvL7ySQ1fI5r89gQtQBvgAGF63n
	 oxIS2F3iB0NpR6+Jqks8q9pcCzxO4Czv5yG95AAe5VZqXzO9UmRK+EbXq/kiX+Famh
	 ZEB8OxYrZz1m41SHbRsY9MJZNiRPv3PQZaAsGfGc8rv4lmCzPqGJogJ3OAQW1X8Ugk
	 QZWQyCKmvOFhA==
Date: Wed, 15 Mar 2023 00:26:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Kuniyuki
 Iwashima <kuniyu@amazon.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Ahern
 <dsahern@kernel.org>, Kuniyuki Iwashima <kuni1840@gmail.com>,
 netdev@vger.kernel.org, Paul Holzinger <pholzing@redhat.com>, Martin KaFai
 Lau <martin.lau@kernel.org>
Subject: Re: [PATCH v1 net 1/2] tcp: Fix bind() conflict check for
 dual-stack wildcard address.
Message-ID: <20230315002625.49bac132@kernel.org>
In-Reply-To: <533d3c1a-db7e-6ff2-1fdf-fb8bbbb7a14c@leemhuis.info>
References: <20230312031904.4674-1-kuniyu@amazon.com>
	<20230312031904.4674-2-kuniyu@amazon.com>
	<533d3c1a-db7e-6ff2-1fdf-fb8bbbb7a14c@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 Mar 2023 12:42:48 +0100 Linux regression tracking (Thorsten
Leemhuis) wrote:
> Link:
> https://lore.kernel.org/netdev/CAG_fn=Ud3zSW7AZWXc+asfMhZVL5ETnvuY44Pmyv4NPv-ijN-A@mail.gmail.com/
> [1]
> Fixes: 5456262d2baa ("net: Fix incorrect address comparison when
> searching for a bind2 bucket")
> Reported-by: Paul Holzinger <pholzing@redhat.com>
> Link:
> https://lore.kernel.org/netdev/e21bf153-80b0-9ec0-15ba-e04a4ad42c34@redhat.com/
> [0]

I tried to fix this manually when applying but:
 - your email client wraps your replies
 - please don't reply to patches with tags which will look to scripts
   and patchwork like tags it should pull into the submission
   (Reported-by in particular, here)
