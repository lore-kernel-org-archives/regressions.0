Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105D71849
	for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 00:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=owenh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=owenh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=owenh.net header.i=@owenh.net header.b="WnY1Ruo4"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Sg0mG3rxFz9sWP;
	Wed, 29 Nov 2023 01:38:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001;
	t=1701218286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDQWK+L4QLJnAgN2GgVFGTEwc8e2Mtybcb9ST9HqB+8=;
	b=WnY1Ruo4L5LiWWP1gUvFZ0Ed0EvP7ttGZp4KMHb+r6kf232wgjRhDWjeBViDhPLSFS638k
	8e0waub8mZfgTf/6dJ8+REQuYXbEuwkn7LgpX9IbmUkD2a+NcMkcsGvEveBdRcvLH0PPRa
	QaQA82l1TpaampBfToUXdEYL53D8QqbSLFP/UB6DhQwIe5NgwLw7DScRnwAsGmub1UCYAO
	BxJFUikjRgiV9/7KeQWSvrdde5QTt0aVvv5sGCV3jDh3zvTI6zhwAWBXZ68Y5QkbLrmgAf
	n3U8we9aiWiqCQ6R+nkBF3vs/2H9pe6sNvWGf3qx5I3tdbAUvhEFGl1EY7j3Rg==
Message-ID: <c1dd675d-cb3e-4c4c-8dc4-dd561ef4950b@owenh.net>
Date: Tue, 28 Nov 2023 18:37:58 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [REGRESSION]: nouveau: Asynchronous wait on fence
From: "Owen T. Heisler" <writer@owenh.net>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
Cc: nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Sasha Levin <sashal@kernel.org>,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org
References: <6f027566-c841-4415-bc85-ce11a5832b14@owenh.net>
 <5ecf0eac-a089-4da9-b76e-b45272c98393@leemhuis.info>
 <6b7a71b4-c8a2-46f4-a995-0c63e7745ca3@owenh.net>
 <c72ca99e-8657-4ed8-9999-5702ebeb5b8c@leemhuis.info>
 <9bce5d00-8db6-4c8b-9817-06502492b44a@owenh.net>
Content-Language: en-US
In-Reply-To: <9bce5d00-8db6-4c8b-9817-06502492b44a@owenh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4Sg0mG3rxFz9sWP

On 11/21/23 14:23, Owen T. Heisler wrote:
> On 11/21/23 09:16, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 15.11.23 07:19, Owen T. Heisler wrote:
>>> On 10/31/23 04:18, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>> On 28.10.23 04:46, Owen T. Heisler wrote:
>>>>> #regzbot introduced: d386a4b54607cf6f76e23815c2c9a3abc1d66882
>>>>> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/180
>>>>>
>>>>> 3. Suddenly the secondary Nvidia-connected display turns off and X 
>>>>> stops responding to keyboard/mouse input.

> I am currently testing v6.6 with the culprit commit reverted.

- v6.6: fails
- v6.6 with the culprit commit reverted: works

See <https://gitlab.freedesktop.org/drm/nouveau/-/issues/180> for full 
details including a decoded kernel log.

Thanks,
Owen

--
Owen T. Heisler
<https://owenh.net>
