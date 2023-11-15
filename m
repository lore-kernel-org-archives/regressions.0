Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB307E
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 06:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=owenh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=owenh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=owenh.net header.i=@owenh.net header.b="UPy5l5wN"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4SVY0R2gGGz9sjL;
	Wed, 15 Nov 2023 07:19:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001;
	t=1700029159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kqsb78qN/a3iPAlXT5iJSYiTM+E0/Epcwz/TQhJRiA=;
	b=UPy5l5wNUBq0+JjXKb61Qnhcr7gqwmG4Nhh5apUKGyyYSIRfSScd3OaRPRZMC6EUgNDxHk
	43wSOdEinsWdWAsnbbyUaLH4LyZsiaHITgmwWqfwuGp2DDOFh/w12aFtkanpKa+zQtd+72
	Izc8OMtSahq1c1Z0avEvOfpViBOdNlpSzwn7hX2OCraYBOSZZs8voJXHDcAsI1Bpazy6hN
	2cIez+g52P7zZaR3g8A+OVfcaY5JxnzjKXBpuZ8k6ztyCke3FhxxOIHcWlGHfWdPRZp6DF
	aI1RCajc96jRP6whnzpUFZuuaEliYx0mOleDbU8tJ8eNHOoBpT5FHRXe0CULyA==
Message-ID: <6b7a71b4-c8a2-46f4-a995-0c63e7745ca3@owenh.net>
Date: Wed, 15 Nov 2023 00:19:07 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [REGRESSION]: nouveau: Asynchronous wait on fence
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
Cc: nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Sasha Levin <sashal@kernel.org>,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org
References: <6f027566-c841-4415-bc85-ce11a5832b14@owenh.net>
 <5ecf0eac-a089-4da9-b76e-b45272c98393@leemhuis.info>
Content-Language: en-US
From: "Owen T. Heisler" <writer@owenh.net>
In-Reply-To: <5ecf0eac-a089-4da9-b76e-b45272c98393@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4SVY0R2gGGz9sjL

On 10/31/23 04:18, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 28.10.23 04:46, Owen T. Heisler wrote:
>> #regzbot introduced: d386a4b54607cf6f76e23815c2c9a3abc1d66882
>> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/180
>>
>> ## Problem
>>
>> 1. Connect external display to DVI port on dock and run X with both
>>     displays in use.
>> 2. Wait hours or days.
>> 3. Suddenly the secondary Nvidia-connected display turns off and X stops
>>     responding to keyboard/mouse input. In *some* cases it is possible to
>>     switch to a virtual TTY with Ctrl+Alt+Fn and log in there.

> You thus might want to check if the problem occurs with 6.6 -- and
> ideally also check if reverting the culprit there fixes things for you.

Hi Thorsten and others,

The problem also occurs with v6.6. Here is a decoded kernel log from an 
untainted kernel:

https://gitlab.freedesktop.org/drm/nouveau/uploads/c120faf09da46f9c74006df9f1d14442/async-wait-on-fence-180.log

The culprit commit does not revert cleanly on v6.6. I have not yet 
attempted to resolve the conflicts.

I have also updated the bug description at
<https://gitlab.freedesktop.org/drm/nouveau/-/issues/180>.

Thanks,
Owen
