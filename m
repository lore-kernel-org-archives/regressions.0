Received: from mx.manguebit.com (mx.manguebit.com [167.235.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FDF149C4D
	for <regressions@lists.linux.dev>; Mon, 29 Jul 2024 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=167.235.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722256474; cv=pass; b=N/3O9VgbWT9dedHnCCFFUeMa3VmqcGE3TZjOG/ajnTs62GsPYSywnJxjgs3UJfDTUl5gMSh6VtKbEZJhzW+SKJURSoqBuArLjqDzUy57po7jbbF5DbGBU2+qgBhHT/BOvX0j6g71UNtjcSe/UUefquo9kPQPLbAZ8G+hXl1DKd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722256474; c=relaxed/simple;
	bh=nfg3wBNZmQi5GBxQqiYZh5LgTUrKcMdeYmj292kZAzs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=uTHgKgD/36foaEPjn7TaK6N5YO6GMxZeOVtSBllYgVq5n/3dkJNslnsV2mmnrw1WI3vDoxZ1kTZxTOOWM5PTVk/uXaOoMWKn2pqKxGEc4m8jF2Ln0Hcyqz2WhgccI9lyjmjVaKAaWwfYZ8S5oZ8JAYdRdbtkiwvwqmM6zPsPqeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com; spf=pass smtp.mailfrom=manguebit.com; dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b=REYp/rTt; arc=pass smtp.client-ip=167.235.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b="REYp/rTt"
Message-ID: <d208a9307b32ccf4d3fd7b08c6b95445@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1722256465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irslpBpFNkXHXkyDe598zvhJ0VrOaDDrRibEdYvfH8c=;
	b=REYp/rTtbVdF1+ydYyeM+aN5Ym7P3B5mru8OVHohPHDzI69oCNPY0+tW8mmpKEBM3H7zJo
	TeQGAfH89Fch+LKS+u5hQBTruQY2PbmNZNq5+bSB19fyP3EmEeFoRtWbTTs4ftximTwcRL
	bEUsJ8qtEUeg4nlAgOnCWzeZPS3gv9jtH05EvBTxdKGbNxoi6sgIFTWIH+8elw77Pjo2gT
	MfiLcH1D+vAlZaqCgCbVaeN2ELZzbgGWezGso1T15HHSUbk/V/jYyxTaEKkYmXkqIE+rzU
	Bt/bZG2IX8G0gXy9pfMYjYdOAjMBHQC9eEiut4DEPKT50PavfTJUc1aWmosx9A==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1722256465; a=rsa-sha256;
	cv=none;
	b=PnQHjO+//LPMqxdP4SlmJIY8m7mOdoF2zaYZ9g+n752UTW7THsmGl5mJ63KbVRUvvsPL3f
	aBuDLoAGeUB5touupqqfYLY3pGYwytCKFIPQ/mEdFsYQp4Wivf4IQ8UkLICLYN8E4u6lrb
	jTS7bbjQAqORcjogcackH6IavQbBiS9s1MpWM7rhzknCN60U3B7sdMSOQJkNO8utNl9OkM
	PGkthsSMS+nQuad9kFuQXWf4C4QD7Xht+SVBHc71y0MSUaxayCc5BFWQTUgmgF/nuqs8ra
	n7STCR/oqozGkUgq4EYtdYAfxpEcuELErDbiLwQG9bMCuHxK2RJFLN14Yq7eow==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1722256465; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irslpBpFNkXHXkyDe598zvhJ0VrOaDDrRibEdYvfH8c=;
	b=TqnUSrqKZAs/CniEr4Aj05FNlmHrW3IKR6EIo613J5QGhdcx6+/aiTjIl5+hzCQ3745LFY
	+k5FH8OMvb4u/s4FtY0OyeWuvja+upeqV3EoxaZb4NPJZu7f+Xe3tOos7KR+ugkkSbbBkd
	UgEZyn0HHalo0/AMFt68jtKZSDkmN+RHfwE/dAFQHM0FRw4e3/dRSk0ghoRV2HSYXyLpmB
	/I2Ir0L2zcrUrjRsKKkJpwMsULV1EoVE/DjyDzlSjL3JEd3Gmdk14RGiuuui6Re0tlpJR9
	wAfnjIeVQ4L2H94AWoog8SjOXpbtUCByoZuuHKO9E20qxtDyqdOsiAhFj9IRpg==
From: Paulo Alcantara <pc@manguebit.com>
To: =?utf-8?Q?Steinbei=C3=9Fer=2C_Sebastian?=
 <Sebastian.Steinbeisser@lrz.de>,
 "tom@talpey.com" <tom@talpey.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Cc: "smfrench@gmail.com" <smfrench@gmail.com>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
In-Reply-To: <8bf2462eb9aa4d30b866da57720a36c90c0a43df.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
 <dd0259752e3557fa1b60dda4db3bf790d9ff877c.camel@lrz.de>
 <4b718a0b9a967d4bc0428a3f706e3b15@manguebit.com>
 <98d458ba-4258-4598-b8fc-0fe6cfeb2f87@talpey.com>
 <2849de0676a015619b922708005a243595f9f56b.camel@lrz.de>
 <6db3dbb8a7a6f4f5ed0f63d0e0c784c7@manguebit.com>
 <8bf2462eb9aa4d30b866da57720a36c90c0a43df.camel@lrz.de>
Date: Mon, 29 Jul 2024 09:34:20 -0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Steinbei=C3=9Fer, Sebastian	<Sebastian.Steinbeisser@lrz.de> writes:

> the patch at lest lead to the test script no longer hanging, but still
> produces the following output
>
> ls /tmp/test
> volume02  volume03
> ls /tmp/test/*
> ls: cannot access '/tmp/test/volume02': Operation not supported
> ls: cannot access '/tmp/test/volume03': Operation not supported

Thanks for testing it.  Please provide network traces.
