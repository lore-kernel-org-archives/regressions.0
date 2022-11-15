Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876E928ED
	for <regressions@lists.linux.dev>; Tue, 15 Nov 2022 09:58:39 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ousiD-0006Pk-Ix; Tue, 15 Nov 2022 10:58:37 +0100
Message-ID: <c56cabb2-9cc4-614d-98e3-e3d4c01e520e@leemhuis.info>
Date: Tue, 15 Nov 2022 10:58:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Fw: [Bug 216557] New: tcp connection not working over ip_vti
 interface #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: netdev@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20221007141751.1336e50b@hermes.local>
 <acc587a0-2c42-b039-fe2a-48f75e7ed462@leemhuis.info>
In-Reply-To: <acc587a0-2c42-b039-fe2a-48f75e7ed462@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1668506319;28e9e9be;
X-HE-SMSGID: 1ousiD-0006Pk-Ix

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 11.10.22 11:03, Thorsten Leemhuis wrote:
> On 07.10.22 23:17, Stephen Hemminger wrote:
> 
>> Begin forwarded message:
>>
>> Date: Fri, 07 Oct 2022 20:51:12 +0000
>> From: bugzilla-daemon@kernel.org
>> To: stephen@networkplumber.org
>> Subject: [Bug 216557] New: tcp connection not working over ip_vti interface
>>
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=216557

#regzbot fixed-by: 3a5913183aa1
