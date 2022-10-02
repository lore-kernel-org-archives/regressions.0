Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E5B3D6A;
	Sun,  2 Oct 2022 21:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664746703;
	bh=Gra+K7fbFtj2EaMWU1nwypxGq8BbiAXHcRCw/1nvCZU=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LD4oGHIBXYpvwI5f2RcbFAcjZErkPFTft/1jPm1WX/PQ4Ed+Om/pp/XzWghy15pLM
	 uHtEAz9/bw7PzWEWjYNFAK9tgds+RA7d8zRKVvfa4EZq0wISZ5qbOdT7tgNC3ZWIuW
	 n2xi2TSKD89xNW6NN+fA0F1E++luog9PlzHca2Xc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.13.110.23] ([143.244.37.73]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1N4Qwg-1pNtKT2ShS-011TEm; Sun, 02
 Oct 2022 23:38:23 +0200
Message-ID: <bf8af199-bd10-8f09-0695-4c166c78aa8e@gmx.com>
Date: Sun, 2 Oct 2022 21:38:21 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Slade Watkins <srw@sladewatkins.net>, Theodore Ts'o <tytso@mit.edu>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>
References: <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <11098E44-8BB4-4318-9BE1-A659573E6BA4@sladewatkins.net>
 <20ddd12f-7277-f343-885d-b39d9ab5c2c3@gmx.com>
 <Yzn+a5lA8fryeGNG@pendragon.ideasonboard.com>
From: "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <Yzn+a5lA8fryeGNG@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WYIHWXtHsTG/iGYEojZI7OVIbS4TLrbRlbiSCV4HzbtbwBpmLYY
 ltPVxt7xWme+KEumRos/AAMipS7Zv7UzU5+Nm/ed9++klcTIef0ljLiUOlNc1MuE6tL4oXo
 5tfmHwjSvPqGIP36TY0aSA1Buj5MIHUcC4G3AcqeRUiJHkS4KLdrqXDu63OtaIoBPaBZ6Wk
 OzAlziaCc827Oa7PRZOKQ==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:1RK4q78BxyU=:oUKVva7eTarg0/Bgho5iUoPC
 kCsGYN8xeZJWsKymyYdkoQe0nI/Nj8xKTaZDqbFq7/ioUie0F0Y1Bwt2aEcydLGuetqboswxj
 5sj7SQCuOxCPpijOXZaFqFyCSn6gxm4wMgTIh0zxYS+0AIMM1N5AJs+T1aQR98bUVZXe5qIy5
 EXGyH0erJ38LhNWK9hzyt6kMIN1ABc3MFPb4dES0FCBrHk3ceVrpHZe8uFf1YZ3EdhDPT+jUV
 KDvRfWt8bH031eeiH+7UHUjfeQ50OGQz5/KQnhMfKATaHDbsddMUL/Q50xEhfJEw7hJzuqhiJ
 BVVT4QYwTdQ99mEc4ylM39wvZNAWsp0mAxMspTWDYifGru0xNYiZ19rZFiVJE12bBy6GmxDwR
 MBjAJ1/EzSRAYG9jvJ0yxLhUk37Bc9q3L5PRnChkvWbjWXVYIFzodAgLdW60uuwfv/YWj+uZL
 Eb4xn9JTXoXyGAlPFfNh8O2xMjvV4IpaWFL9qthLuHK0cRFA/owB+hLzS48U1rXsCLNXzCsPD
 8bUwqfqY6vuoG88mjn5eCFKPwaJ4ZptNTpm+h3l7TWdxNqNCubUFLsUorV6vR+bx3c1eprt8h
 FzN7dpiARtByonXT/Zn7Q11YrgrXoqpOvywBdtybHp94sIXRF7X+YPYCxUtAMANbZYv1E28UF
 +ZAV/3/nHrSFuKFH8cK5ob1IG4xuynv8qBG38fLeGsaMVzhrOwJSTu5UD4io1VpsX8iHnYdEW
 oRSS0Tisuaf7HIECc4105hDH8U6WlS4JjqDeb79G/XRkDKUv08FFN0dOLKPIV2XBzj6MSGruJ
 3OojadePAo0a83dZMng0qdF96bFcbXwr4vFgr3+xJRqL6ZiLTenWPDVri13v3euMDyzWMuNf+
 OXhjztQ0eVdtqDJCTJI+vuSRVZARBDrwFbvh3YlfNlvWgXIWzyo2xX/cEyA0EpXvinTuy1ANb
 iFaSUH+rh2eSLDRCo+St4SlxL0KszGuJNGU1M9FVwm6VrrtvakZ5Bg2TiSGJ9z5vrBSK4Sdmr
 8HVvMMJQkEw7w9BgB1q5gjDcKB6KyuKQJv28OG1TJUgZnbERXQMdRRwqmhH0FaD1t+Ua/qU/W
 xX1cB/rLRibG12/Vs8USu7z9z5hsAPabU0AMlGRICbi+uVnVa4MahwZ0M/gxhEPWFJyiVxrxv
 Qlis9TljOvwrUADDoiIdB7r6VaYfPMEN5SGDTp90lKKIIQ==



On 10/2/22 21:11, Laurent Pinchart wrote:
>
> Do you realize how insulting this is, for all the developers and
> maintainers who spend lots of their free time doing their best ? It's
> all very nice to complain and rant, but if you want things to move
> forward, lead the effort and work on it.
>

Considering how much I've poured into this discussion already and all my
_unpaid_ work to improve Linux over the past 25+ years, to accuse me of
this sounds like pure insult.

The part your replied to? That was thinly veiled sarcasm seeing such
strong resistance from people who have seemingly never even visited
bugzilla. I'm appalled you took it at face value.

I'm taken aback by people who oppose bugzilla which has helped resolve
criticial issues and implement important features in a manner which
wouldn't be possible using email. It's my only reaction. I'm alive and
it pains me to see a decent collaborative tool being harshly criticized
to no end with no _working_ alternatives being proposed.

Regards,
Artem
