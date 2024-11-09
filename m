Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F041991C2
	for <regressions@lists.linux.dev>; Sat,  9 Nov 2024 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731164084; cv=none; b=ONFjCPTlNIMtEA5CUR9Rqsz4L9E2aBRf2yvapOvCtvwj/FaZCcJ5LeA8cYfxAz00XD0oLZGVql0gKEFpQJhFppjff33a7y5tGPIRow7x9lCCLHnpDENRZGXXxZkJSwc/+kFnGMOBBVbtnOmMRG5MWVOY11Ic0Uglso4b/ezkNzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731164084; c=relaxed/simple;
	bh=iYifo8ZvWHr/K4r81W2teRDYrrpPR7lszO+IvzWuG20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lgXDoiFfPRSuKGG5JIMAL8JnKlQP0aXdWWht7DtZjyPpe3N+N6e0JeBPDowJ65/mon8IuDlk6TwiGmH80aij/5i58IryB2xnl/jOsEseq7IzxtSVbbAGOesATM1rczRpJyIUP4cU7oUH0JQdrhnRkwUBEl6kbkTpaoQ+oEWl/Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: =?utf-8?Q?Ulrich_M=C3=BCller?= <ulm@gentoo.org>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: Ulrich =?utf-8?Q?M=C3=BCller?= <ulm@gentoo.org>,
  stable@vger.kernel.org,  Linux
 regressions mailing list <regressions@lists.linux.dev>,  He Lugang
 <helugang@uniontech.com>,  Jiri Kosina <jkosina@suse.com>
Subject: Re: [REGRESSION] ThinkPad L15 Gen 4 touchpad no longer works
In-Reply-To: <a4b1bae4-5235-4f19-bcdb-5ed9b67449b1@leemhuis.info> (Linux
	regression tracking's message of "Sat, 9 Nov 2024 13:42:21 +0100")
References: <uikt4wwpw@gentoo.org>
	<a4b1bae4-5235-4f19-bcdb-5ed9b67449b1@leemhuis.info>
Date: Sat, 09 Nov 2024 15:54:36 +0100
Message-ID: <ucyj4h2z7@gentoo.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

>>>>> On Sat, 09 Nov 2024, Linux regression tracking (Thorsten Leemhuis) wr=
ote:

> On 03.11.24 09:24, Ulrich M=C3=BCller wrote:
>> After upgrading from 6.6.52 to 6.6.58, tapping on the touchpad stopped
>> working. The problem is still present in 6.6.59.
>>=20
>> I see the following in dmesg output; the first line was not there
>> previously:
>>=20
>> [    2.129282] hid-multitouch 0018:27C6:01E0.0001: The byte is not expec=
ted for fixing the report descriptor. It's possible that the touchpad firmw=
are is not suitable for applying the fix. got: 9
>> [    2.137479] input: GXTP5140:00 27C6:01E0 as /devices/platform/AMDI001=
0:00/i2c-0/i2c-GXTP5140:00/0018:27C6:01E0.0001/input/input10
>> [    2.137680] input: GXTP5140:00 27C6:01E0 as /devices/platform/AMDI001=
0:00/i2c-0/i2c-GXTP5140:00/0018:27C6:01E0.0001/input/input11
>> [    2.137921] hid-multitouch 0018:27C6:01E0.0001: input,hidraw0: I2C HI=
D v1.00 Mouse [GXTP5140:00 27C6:01E0] on i2c-GXTP5140:00
>>=20
>> Hardware is a Lenovo ThinkPad L15 Gen 4.
>>=20
>> The problem goes away when reverting this commit:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/drivers/hid/hid-multitouch.c?id=3D251efae73bd46b097deec4f9986d926813aed744

> Thx for the report. Is this a 6.6.y specific thing, or does it happen
> with 6.12-rc6 or later as well?  And if it does: does the revert fix it
> there, too?

It still happens with 6.12-rc6, and the revert fixes it.
