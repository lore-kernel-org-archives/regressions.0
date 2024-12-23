Received: from srv08.itamservices.de (srv08.itamservices.de [138.201.137.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE1BDF78;
	Mon, 23 Dec 2024 03:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.201.137.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734925639; cv=none; b=rFECURPRpgol9p4bXbGWjM5PoruG3DSqHPvT/PmgvHYeL9wRAuubSZpHvCXj1W7Xdi7uj/GHh3voYB12q4Q4Gj6WatGsuIxxOcUZFhI4dBgSuKK+a3C7343sHQN1rxMSPqwp5GEOJZ3MFTPwKwCijwFqsDyEC5iNF/pz8H9UffQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734925639; c=relaxed/simple;
	bh=jrQXbNBnQnsqHkHf/ClSbS5Oani1ThTwOrQWCZPwMlQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:Cc:
	 In-Reply-To:Content-Type; b=TX7bm3DeCNjMlSZVV7gdmV7ukDdRzyG6XyYI93ZL/eJBmBGfaOUQAqXWn5Sx6zhvnwiICuiAX7dbxBJ9XvNAsG8rv/ucfuGA4QHn/ypuxyWH0AaMUCE/LSORp2dlRTXz0OSqtRG/cD7E3LVYyRTkrp3EAsbgbDwEYo1yxNtu7a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nachtgeist.net; spf=fail smtp.mailfrom=nachtgeist.net; arc=none smtp.client-ip=138.201.137.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nachtgeist.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nachtgeist.net
Received: by srv08.itamservices.de with esmtpsa (TLS1.3:ECDHE_SECP384R1__RSA_PSS_RSAE_SHA384__CHACHA20_POLY1305:256) (Exim 4.96)
	(envelope-from <debian@nachtgeist.net>)
	id 1tPYpx-004WEk-1U;
	Mon, 23 Dec 2024 04:10:29 +0100
Message-ID: <befd89c7-474f-4713-a2b0-6bcc1f2461b0@nachtgeist.net>
Date: Mon, 23 Dec 2024 04:10:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Daniel Reichelt <debian@nachtgeist.net>
Subject: Re: Bug#1089698: linux: Loop-mounted UDF ISOs no longer readable
To: Salvatore Bonaccorso <carnil@debian.org>, zhaomengmeng@kylinos.cn,
 jack@suse.cz
References: <173392552823.2176723.16461319920125128905.reportbug@enterprise.startrek.nachtgeist.net>
 <Z17iMjM5jqc0o3uu@eldamar.lan>
 <173392552823.2176723.16461319920125128905.reportbug@enterprise.startrek.nachtgeist.net>
 <d1ed7b71-b6a4-4feb-9126-c05bdd7db7d1@nachtgeist.net>
 <Z2XLm0XdGof_nNIt@eldamar.lan>
Content-Language: de-DE
Cc: 1089698@bugs.debian.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
In-Reply-To: <Z2XLm0XdGof_nNIt@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.12.24 20:55, Salvatore Bonaccorso wrote:
> Additionally I have now reported the issue on the regressions list as
> well:
> 
> https://lore.kernel.org/regressions/Z2XKY0f6on1UbwWb@eldamar.lan/T/#u

Splendid, thanks!


Quick update: 6.2 is also OK, so we have:

OK still:
   6.1.112-1
UNKNOWN - not in [1], yet to be bisected/compiled
   6.1.113
   6.1.114
BAD:
   6.1.115-1
   6.1.119-1
   6.1.120 not part of [1], but out-of-tree build was bad
OK again:
   6.2 (upstream vanilla)
   6.3.1-1~exp1
   6.11.10 (current Debian testing/Trixie)
   6.12.5  (current Debian unstable/sid)


[1] https://snapshot.debian.org/package/linux/


Thanks to y'all!
Daniel
