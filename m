Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5A71641A
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 18:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boDtVr/4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF821C433C7;
	Sun, 12 Nov 2023 18:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699815272;
	bh=PNhN219Fj+4DlAZyh19H0dvERmW5Z2p5dY8szFMpfb8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=boDtVr/400yhic97q5aMnlM0U99c3H86Dd2OH54C1W/cA/2U6J+kPlCFjg1dMV+sz
	 qWwLo4oz8Y7PKkuXMQ46xm+tiKIbPZ+zu5sIHc/vEg36NK5pbfuBrerH3gvk6yXE0v
	 J3M1kgYV63gjrNQbteimy6ft4+8AWkPxYEldlbfj7jkxpr+ZQYLQ3sPyITCfMfpk03
	 Uk7tQed4TV4nlL5gpJa5ja7KlvDtqDFFR770rGbbb28xVIbSCzl/nET5elBzW1Hn5Y
	 WKg8SdzTxDF9WR17jGVwW5uzXSCBh2naFi/QKXu/k20BEVTtX94JeSpK+tmAZURiON
	 A6J64Ojm3AQaA==
From: Kalle Valo <kvalo@kernel.org>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,  Linux Wireless
 <linux-wireless@vger.kernel.org>,  pagadala.yesu.anjaneyulu@intel.com,
  gregory.greenman@intel.com,  Linux Regressions
 <regressions@lists.linux.dev>,  Johannes Berg <johannes@sipsolutions.net>,
  Bagas Sanjaya <bagasdotme@gmail.com>,  Miri Korenblit
 <miriam.rachel.korenblit@intel.com>,  =?utf-8?Q?Nikl=C4=81vs_Ko=C4=BCes?=
 =?utf-8?Q?=C5=86ikovs?=
 <pinkflames.linux@gmail.com>,  Damian Tometzki <damian@riscv-rocks.de>
Subject: Re: [PATCH v4] wifi: iwlwifi: fix system commands group ordering
References: <20231112095943.19353-1-emmanuel.grumbach@intel.com>
	<20231112143620.36619-1-emmanuel.grumbach@intel.com>
Date: Sun, 12 Nov 2023 20:54:27 +0200
In-Reply-To: <20231112143620.36619-1-emmanuel.grumbach@intel.com> (Emmanuel
	Grumbach's message of "Sun, 12 Nov 2023 16:36:20 +0200")
Message-ID: <875y26ajks.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Emmanuel Grumbach <emmanuel.grumbach@intel.com> writes:

> From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
>
> The commands should be sorted inside the group definition.
> Fix the ordering so we won't get following warning:
> WARN_ON(iwl_cmd_groups_verify_sorted(trans_cfg))
>
> Link: https://lore.kernel.org/regressions/2fa930bb-54dd-4942-a88d-05a47c8=
e9731@gmail.com/
> Link: https://lore.kernel.org/linux-wireless/CAHk-=3Dwix6kqQ5vHZXjOPpZBfM=
7mMm9bBZxi2Jh7XnaKCqVf94w@mail.gmail.com/
> Fixes: b6e3d1ba4fcf ("wifi: iwlwifi: mvm: implement new firmware API for =
statistics")
> Tested-by: Nikl=C4=81vs Ko=C4=BCes=C5=86ikovs <pinkflames.linux@gmail.com>
> Tested-by: Damian Tometzki <damian@riscv-rocks.de>
> Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
> Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>

Linus, I suspect it will take a while before we make a new wireless pull
request (there's currently just one commit in the wireless tree). So if
you want to take this directly to your tree please go ahead, otherwise
you get it via the normal route in a week or two. Just let us know what
you prefer.

Acked-by: Kalle Valo <kvalo@kernel.org>

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
