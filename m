Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28978A93E
	for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 16:47:56 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pIY4w-0005KR-3r; Thu, 19 Jan 2023 17:47:54 +0100
Message-ID: <01a7d086-c505-582e-70d0-c76262c55f1d@leemhuis.info>
Date: Thu, 19 Jan 2023 17:47:53 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
Content-Language: en-US, de-DE
To: Hans de Goede <hdegoede@redhat.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
 <1890f2f1-ffe7-91ae-931d-253bdbbf520e@redhat.com>
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <1890f2f1-ffe7-91ae-931d-253bdbbf520e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1674146876;c552d9e7;
X-HE-SMSGID: 1pIY4w-0005KR-3r

On 19.01.23 16:54, Hans de Goede wrote:
>
> <deliberate offlist remark>

That didn't work due to my deliberate but slightly unusual usage of
"reply-to" for regression tracking mails.

I only noticed now. Whatever.

> You dropped a leading 0 here (should be 0e44c2170876197) and
> at for various tools this leading 0 matters, e.g.:

Hah, of course it does, I well aware of that. Seem I was simply too
stupid to do cut'n'paste properly or something like that. many thx for
letting me know!

Ciao, Thorsten
