Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB121C5F37;
	Fri, 20 Dec 2024 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734700416; cv=none; b=Pa6TKGRQ8Nm2irMgQcFE6dRpkkoyb9zsQbiRpvIWQvpQM5Sc5iiQIv/+E4VwBGi8V7hNhTILn3ENmwNb/npOZIBQQYWEGgfj0w+4fn7xHhFUvRcake0H7mzmK8N26dV9VgxHqnEiUc150KYKll1NHw+u6/RQJsLY2FWlgr2W2Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734700416; c=relaxed/simple;
	bh=nw71UcSITtn+v9KH8wZOwlxUZfijdplRRsef/oVpDVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWKvgpZraNAAuIhtCQofzTo5yoxbnSMwsqIqU7z1qrDR8HxiRqrB7fw2NG6Pza54CLtU54SCyeE1q3U+YqUtBT+xl1Aahv6ij7owSgw5RfheSHH1l51kUmgNlnU4QHzATDBMS8JLVdsnSWfPL7k0flMg1d5NEp7th+uUCw/+wkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SlgCrKFE; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SlgCrKFE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=eCyqR2M+g78rWHNsbS2JU6hYufz9nzoWytPFPK9eYn4=; t=1734700414;
	x=1735132414; b=SlgCrKFEou7HrE7LiSkjh/ElEp0gmgyHcztAe91Ggu+TkMufZBdvJmNiRVcvA
	wSiBkhy5Ki5ofZEuvmj3mMLL2feTJ/cdAlPMNnlyUE5ISGGxIxEB//pgrd8qEj0Qfn5HP7glDfozQ
	0Cs4YJOojXChcm/2aZAWkHuVdmL2gACDikPiWznCTJP5al+JVeFYFpPTZlLZftcLYwJ6woqeSAtYM
	ysgyeX4mHpsQGpdeqHGpPlpoZWPChgTwkc974J1e2Xx61ul//wx8Z0IhYi8QGn8p5EfPdW+S/umlG
	uldoYW86Jb7ftOax5OemfN5YfvElV1U8Lk4ZGzg7MQ7P0AAiOQ==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1tOcor-00Cwa9-0G;
	Fri, 20 Dec 2024 14:13:29 +0100
Message-ID: <38f33891-ce19-4df5-9bab-d53443393305@leemhuis.info>
Date: Fri, 20 Dec 2024 14:13:28 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] docs: 6.Followthrough.rst: interaction with stable
 wrt to regressions
To: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
 regressions@lists.linux.dev, linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg KH <gregkh@linuxfoundation.org>
References: <cover.1733825632.git.linux@leemhuis.info>
 <d7793d2e788e7d98a67e90f85a77d42dab1b8da1.1733825632.git.linux@leemhuis.info>
 <87ed2bwo46.fsf@trenco.lwn.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <87ed2bwo46.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1734700414;2d5cffaf;
X-HE-SMSGID: 1tOcor-00Cwa9-0G



On 13.12.24 17:20, Jonathan Corbet wrote:
> Thorsten Leemhuis <linux@leemhuis.info> writes:
> 
>> Add a few notes on how the interaction with the stable team works when
>> it comes to mainline regressions that also affect stable series.
>>
>> This removes equivalent paragraphs from a section in
>> Documentation/process/handling-regressions.rst, which will become mostly
>> obsolete through this and follow-up changes.
>>
>> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
>> ---
>>  Documentation/process/6.Followthrough.rst     | 22 +++++++++++++++++++
>>  .../process/handling-regressions.rst          | 19 ----------------
>>  2 files changed, 22 insertions(+), 19 deletions(-)
>>
>> diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
>> index f9ae3a86ee0c49..763a80d21240f0 100644
>> --- a/Documentation/process/6.Followthrough.rst
>> +++ b/Documentation/process/6.Followthrough.rst
>> @@ -234,6 +234,28 @@ On procedure:
>>     requests again should ideally come directly from maintainers or happen in
>>     accordance with them.
>>  
>> +Regarding stable and longterm series:
>> +
>> + - You are free to leave handling regressions to the stable team if the problem
>> +   at no point in time occurred with mainline or was fixed there already.
>> +
>> + - When receiving reports about regressions in recent stable or longterm kernel
>> +   series, consider evaluating at least briefly if the issue might happen in
>> +   current mainline as well -- and if that seems likely, take hold of the
>> +   report.  If in doubt, ask the reporter to check mainline.
>> +
>> + - Fix regressions quickly in mainline, whenever you want to swiftly resolve one
>> +   that recently made it into a mainline, stable, or longterm release; in urgent
>> +   cases hence involve Linus to fast-track fixes (see above).  This route is
> 
> I'm not quite sure what that sentence is intended to say.  Might
> something like s/quickly/first/ better convey the intent?  Maybe also
> s/want/need/ ?

Hmmm. I went with this:

"""
 - You must fix any regression in mainline first that also happens in
mainline, stable, or longterm releases due to the same change.  That's
because the stable team only addresses such problems once they were
fixed in mainline. In urgent cases hence involve Linus to fast-track
fixes (see above).
"""

I liked the old approach a bit better, but yeah, I guess it overloaded
the first sentence. :-/

Ciao, Thorsten
