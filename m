Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E423209
	for <regressions@lists.linux.dev>; Mon, 10 Oct 2022 16:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1FEC433D6;
	Mon, 10 Oct 2022 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665420875;
	bh=qPWTNZGEFYJEvDdkwFCY39pduTasoX2MPE4faZjFyb4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=t5l+1qwolo90SbopV9MI+P+M+f7fq6BmW4pX1FJAWtWDWbvPCt430v6pyP3RHQ/Wt
	 WXhBOzZPLGHezZoSxWW4wCcuOMQBy/ShYXEQgQTtDl623KuQO+vtAURfkwzqUtpiK9
	 bJ6f/pKi8qgT3k4u5nfQHdOy6I3521qnJ7S1owY3e3ahcYzRVCEtlpfAN/sAN3Gr4B
	 RK07rqwIMD3qkovObsKN2CVTLqEsNB1seI3uCb5Vx0EyRHmFYOhb9YU01UTSyHS8uL
	 c6yWO8xfCroHNMUKiyn8aM5LpNkk/T4m1iJnGISl1nzNP1cfBm+adbZgIieTkgtDiu
	 mQBMoOT4prXLQ==
From: Kalle Valo <kvalo@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Netdev <netdev@vger.kernel.org>,  open list <linux-kernel@vger.kernel.org>,  linux-wireless@vger.kernel.org,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  ath11k@lists.infradead.org,  regressions@lists.linux.dev,  lkft-triage@lists.linaro.org
Subject: Re: drivers/net/wireless/ath/ath11k/mac.c:2238:29: warning: 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0
References: <CA+G9fYsZ_qypa=jHY_dJ=tqX4515+qrV9n2SWXVDHve826nF7Q@mail.gmail.com>
Date: Mon, 10 Oct 2022 19:54:29 +0300
In-Reply-To: <CA+G9fYsZ_qypa=jHY_dJ=tqX4515+qrV9n2SWXVDHve826nF7Q@mail.gmail.com>
	(Naresh Kamboju's message of "Wed, 21 Sep 2022 16:05:39 +0530")
Message-ID: <87ilkrpqka.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

+ arnd

Naresh Kamboju <naresh.kamboju@linaro.org> writes:

> Following build warnings noticed while building arm64 on Linux next-20220921
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> In function 'ath11k_peer_assoc_h_he',
>     inlined from 'ath11k_peer_assoc_prepare' at
> drivers/net/wireless/ath/ath11k/mac.c:2662:2:
> drivers/net/wireless/ath/ath11k/mac.c:2238:29: warning:
> 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
> 0 [-Wstringop-overread]
>  2238 |                         v = ath11k_peer_assoc_h_he_limit(v,
> he_mcs_mask);
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:2238:29: note: referencing
> argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
> function 'ath11k_peer_assoc_h_he_limit'
>  2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function 'ath11k_peer_assoc_h_he',
>     inlined from 'ath11k_peer_assoc_prepare' at
> drivers/net/wireless/ath/ath11k/mac.c:2662:2:
> drivers/net/wireless/ath/ath11k/mac.c:2251:21: warning:
> 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
> 0 [-Wstringop-overread]
>  2251 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:2251:21: note: referencing
> argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
> function 'ath11k_peer_assoc_h_he_limit'
>  2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function 'ath11k_peer_assoc_h_he',
>     inlined from 'ath11k_peer_assoc_prepare' at
> drivers/net/wireless/ath/ath11k/mac.c:2662:2:
> drivers/net/wireless/ath/ath11k/mac.c:2264:21: warning:
> 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
> 0 [-Wstringop-overread]
>  2264 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:2264:21: note: referencing
> argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
> function 'ath11k_peer_assoc_h_he_limit'
>  2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function 'ath11k_peer_assoc_h_he',
>     inlined from 'ath11k_peer_assoc_prepare' at
> drivers/net/wireless/ath/ath11k/mac.c:2662:2:
> drivers/net/wireless/ath/ath11k/mac.c:2264:21: warning:
> 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
> 0 [-Wstringop-overread]
>  2264 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:2264:21: note: referencing
> argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
> function 'ath11k_peer_assoc_h_he_limit'
>  2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function 'ath11k_peer_assoc_h_he',
>     inlined from 'ath11k_peer_assoc_prepare' at
> drivers/net/wireless/ath/ath11k/mac.c:2662:2:
> drivers/net/wireless/ath/ath11k/mac.c:2264:21: warning:
> 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
> 0 [-Wstringop-overread]
>  2264 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:2264:21: note: referencing
> argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
> function 'ath11k_peer_assoc_h_he_limit'
>  2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function 'ath11k_peer_assoc_h_he',
>     inlined from 'ath11k_peer_assoc_prepare' at
> drivers/net/wireless/ath/ath11k/mac.c:2662:2:
> drivers/net/wireless/ath/ath11k/mac.c:2251:21: warning:
> 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
> 0 [-Wstringop-overread]
>  2251 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:2251:21: note: referencing
> argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
> function 'ath11k_peer_assoc_h_he_limit'
>  2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Build log: https://builds.tuxbuild.com/2F4W7nZHNx3T88RB0gaCZ9hBX6c/

Thanks, I was able to reproduce it now and submitted a patch:

https://patchwork.kernel.org/project/linux-wireless/patch/20221010160638.20152-1-kvalo@kernel.org/

But it's strange that nobody else (myself included) didn't see this
earlier. Nor later for that matter, this is the only report I got about
this. Arnd, any ideas what could cause this only to happen on GCC 11?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
