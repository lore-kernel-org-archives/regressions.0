Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CDE2F26
	for <regressions@lists.linux.dev>; Tue,  8 Feb 2022 08:57:46 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 4642F5C1D10;
	Tue,  8 Feb 2022 09:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1644310259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jdbAvq7z9eTXY5eg8HuXoMcDIWe+qtaUrY5jz0a9as0=;
	b=ruHoVnCHu83SL64ZG8dQ0vlZHaDEy0F4DPhonRJmt+UYDYSHEZJ/P+5I0fU4TybtQxq1yf
	B8wKMcJCn6PWRRvtL/NwQoxiE10x3AYsYag4chdsAtrFa+W5BPdeWOmaV60k3lwvE9uhr3
	C9RaadyqT2rpoNI41gJE3v1nS6dpInQ=
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 08 Feb 2022 09:50:59 +0100
From: Stefan Agner <stefan@agner.ch>
To: Jason Self <jason@bluehome.net>, Greg KH <gregkh@linuxfoundation.org>,
 Johannes Berg <johannes.berg@intel.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Regression/boot failure on 5.16.3
In-Reply-To: <20220203161959.3edf1d6e@valencia>
References: <20220203161959.3edf1d6e@valencia>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <00b41f5de94fca5ef995ab2c95def4aa@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2022-02-04 01:19, Jason Self wrote:
> The computer (amd64) fails to boot. The init was stuck at the
> synchronization of the time through the network. This began between
> 5.16.2 (good) and 5.16.3 (bad.) This continues on 5.16.4 and 5.16.5.
> Git bisect revealed the following. In this case the nonfree firmwre is
> not present on the system. Blacklisting the iwflwifi module works as a
> workaround for now.

I have several reports of Intel NUC 10th/11th gen not booting/crashing
during boot after updating to 5.10.96 (from 5.10.91). At least one stack
trace shows iwl_dealloc_ucode in the call path. The below commit is part
of 5.10.96 So this regression seems to not only affect 5.16 series.

Link:
https://github.com/home-assistant/operating-system/issues/1739#issuecomment-1032013069

--
Stefan


> 
> 6b5ad4bd0d78fef6bbe0ecdf96e09237c9c52cc1 is the first bad commit
> commit 6b5ad4bd0d78fef6bbe0ecdf96e09237c9c52cc1
> Author: Johannes Berg <johannes.berg@intel.com>
> Date:   Fri Dec 10 11:12:42 2021 +0200
> 
>     iwlwifi: fix leaks/bad data after failed firmware load
>     
>     [ Upstream commit ab07506b0454bea606095951e19e72c282bfbb42 ]
>     
>     If firmware load fails after having loaded some parts of the
>     firmware, e.g. the IML image, then this would leak. For the
>     host command list we'd end up running into a WARN on the next
>     attempt to load another firmware image.
>     
>     Fix this by calling iwl_dealloc_ucode() on failures, and make
>     that also clear the data so we start fresh on the next round.
>     
>     Signed-off-by: Johannes Berg <johannes.berg@intel.com>
>     Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
>     Link:
>    
> https://lore.kernel.org/r/iwlwifi.20211210110539.1f742f0eb58a.I1315f22f6aa632d94ae2069f85e1bca5e734dce0@changeid
>     Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
>     Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
>  drivers/net/wireless/intel/iwlwifi/iwl-drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
