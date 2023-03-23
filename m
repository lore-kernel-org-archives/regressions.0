Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FB3BA54
	for <regressions@lists.linux.dev>; Thu, 23 Mar 2023 18:09:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0062F60A;
	Thu, 23 Mar 2023 18:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0062F60A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1679594940; bh=SlOsnE3ROIiiL+w8Oz/hp4NVxixmK2YoIp2+jx6LKP0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OAp22PHG0zTEhZ++nCxC1kMRER81C4iyLXenSYYo2LqZU0LOxkeHM7BAsr37I/4J6
	 RWfFH/L1wB+gowF7gAS4bAAY9j/sU3sDWX+48lVVWQBzzdk/+ROymRNuFSpG/wn/wj
	 lnkosahI2q9ZNORX1FmQgSly/TChfNxfOXOU0AGyu8DMWv49l9N6dTktiUv0iIg2Je
	 m8FtvglVEuZ0ZOT7dqXvIh/2TZR8edou6sKkVj3cNP8dM5ExbviYMIFXoicP+i5oRH
	 vwSIY3uoZDLRKcrXMymggTGyi+2gawBPjYGHh3fMJzX9W5RBgGewviBX9vB27bItos
	 +ExZwwKA02LIg==
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Randy Dunlap <rdunlap@infradead.org>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v3] docs: describe how to quickly build a trimmed kernel
In-Reply-To: <a9c2fa30-569b-e69a-fb06-3dc093538b53@leemhuis.info>
References: <1a788a8e7ba8a2063df08668f565efa832016032.1678021408.git.linux@leemhuis.info>
 <87a60frxk0.fsf@meer.lwn.net>
 <d233a796-1cb8-a9b3-5a50-043dd2f98b3e@leemhuis.info>
 <87edpomtzn.fsf@meer.lwn.net>
 <165bd284-580d-df03-ab04-f5214b1e6be4@leemhuis.info>
 <87jzz7creg.fsf@meer.lwn.net>
 <a9c2fa30-569b-e69a-fb06-3dc093538b53@leemhuis.info>
Date: Thu, 23 Mar 2023 12:08:59 -0600
Message-ID: <87lejnbaro.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

>> Did you have further tweaks, or should I take v3?
>
> No further tweaks, so feel free to apply it as it is.

OK, that is now done - thanks.

jon
