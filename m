Received: from mx.manguebit.com (mx.manguebit.com [167.235.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635CE1850AF
	for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 12:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=167.235.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721046083; cv=pass; b=JEpr9Qwaooa4ke3iHp+St9yaJ+MqKcmAtPBRH/ZIROBLLMxooLeGS5dzqYrFZ0b+9vKS9fnquU+SpcaFjDabIARHxpMlXHQGEAtl9RVXiTkflGzyGLDemzwoJTgkAZmqHZ7oKxuPjpL6voiAppG6kfgew3MxiFMzgvoeHE/ol4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721046083; c=relaxed/simple;
	bh=E7NSPf6qQcB6GevNiiBBbvpKPTMY5AavjxxVpTTV0nY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=AV2DTmHCsFSqeFoQ0qZUZUDlrD3RJ2bUjI17NkZPXPF+ZwLo3J/QRu6Oqime4+5O+C1lQvqs2xCRnQAR2WM6K0k3ugYUq/Xr2r2C3qf1HT4ThfCVsrQHZ9VAY4eIr2hfyAmW4kphOVpmIz+49YC+DU8vDak43Fmka3OStPQa2Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com; spf=pass smtp.mailfrom=manguebit.com; dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b=lVOuB2DV; arc=pass smtp.client-ip=167.235.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b="lVOuB2DV"
Message-ID: <505eef55e45f00146321b7de6549ca46@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1721046078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CAP2gFOSqYPxoqMV7zPIv79X9VYf5Q7o1KEArkSHxF0=;
	b=lVOuB2DV1Aa7dBclmJfj/80UoTRwcQi06MxYl1Xee1J51+FK4Cqcq1vXQl7RQJWNioPABz
	W+j4/OYmJcnBeClFUqdpQ8g/eAB4wKy06btU7S+DT8P1kv9DCKjcjXdIkpmW19gOeHZGs4
	Q7SFX0C5OMyDJ3qvGSv+qdIeom4RBfoTzJN89x+sxQQ0bwgFNx1QXcSjA2ZOTFe158ZUs8
	u0JEfalKU5y3jE1eHmHkVGMfZ8FIDCBlSYwYsSMYRqJUM1LV2Ow/aNPvRe9LYcqUYKz3hg
	I1Zlb9HPBdkLO+nuCnzl4VF0z7hpYnJwfR0oGvahYUoevMt8pRFao8h2TtH7xw==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1721046078; a=rsa-sha256;
	cv=none;
	b=UDh41pIEzfI/EdJwKBwkAkq/4EjQrAZV9QIFhx/fqJ+ZI+bwQcOgU+9I2b420c9fugWG9y
	wYbXQYnUwQUKJZ+jqaOYRkguFbkMAmAlZ+IEAXv75wmmrJ+xwYx+zAdngHHevsgnnI6Ax4
	ccbvxkmH9cQP4ItHQep7v5uuXWvtmJTAmatuRfKYZGkg8KKOD9oEWQxwtCeey1rAMlvPro
	4hrbsoWm4gHZws/BkXI/zvrUDnp5slOGM2VmVlnmHdkg2CGYkzdBYDt4mFjz6VSisjEy5b
	bhUXGUjZcueyqrP1XMOWAFJqSdYUxayuFV2zCAOoYU/DJr7OMk9yK31c/AQz7g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1721046078; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CAP2gFOSqYPxoqMV7zPIv79X9VYf5Q7o1KEArkSHxF0=;
	b=o35++bss38B99GOZ1miCSu68pJW4I5hfwxQNnXFleLeaV/9ZyKOQeYnRugd9CNdYNUeFbb
	7wVOuVhvVgVz+AnMtPAt/iz8cSb2vG+mlgIBExBPu0eRtwGkC6DA97c24V40rpSxA5nG6p
	3gnI8xxTtMtmCuo71xQCH3AdwxALS+EJpHQpNZA20Fe907wQA+gHKJxc5Vn+0BpdQfh4kv
	KuVWWKDNetF5Oc9PyaB11e6llvyJkzWLJP6C4ufm8yaKjX7ZtE3+MPovOGkVtcmJLQPztr
	XC7BM77eSYcqNWmw6nMl5x1QI1xBQBZoi2XEbr1gLmzi8nC3/h4GW1MfyvNUCA==
From: Paulo Alcantara <pc@manguebit.com>
To: =?utf-8?Q?Steinbei=C3=9Fer=2C_Sebastian?=
 <Sebastian.Steinbeisser@lrz.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
In-Reply-To: <00654293b73f861514a9fb61723a8a424be92bc2.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
 <00654293b73f861514a9fb61723a8a424be92bc2.camel@lrz.de>
Date: Mon, 15 Jul 2024 09:21:14 -0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Steinbei=C3=9Fer, Sebastian	<Sebastian.Steinbeisser@lrz.de> writes:

> I'll try and get that done. I'm currently in the process of bisecting
> the issue on the side.

Awesome.  Thanks!
