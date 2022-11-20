Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BB27EC
	for <regressions@lists.linux.dev>; Sun, 20 Nov 2022 10:51:31 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1owhcr-00035t-Kz; Sun, 20 Nov 2022 11:32:37 +0100
Message-ID: <8117aac8-947e-49ca-c2b1-ef45c2914975@leemhuis.info>
Date: Sun, 20 Nov 2022 11:32:36 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [Intel-wired-lan] igc kernel module crashes on new hardware
 (Intel Ethernet I225-V)
Content-Language: en-US, de-DE
To: Conor Dooley <conor@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: Ivan Smirnov <isgsmirnov@gmail.com>,
 "Neftin, Sasha" <sasha.neftin@intel.com>,
 "Fuxbrumer, Devora" <devora.fuxbrumer@intel.com>,
 intel-wired-lan@lists.osuosl.org, "Ruinskiy, Dima"
 <dima.ruinskiy@intel.com>, "Avivi, Amir" <amir.avivi@intel.com>,
 regressions@lists.linux.dev
References: <CAPAtJa_o5q-sU+AD=G3y43H_5pBKnOZTQGXM99uszPXNkn8Z9A@mail.gmail.com>
 <20221031170535.77be0eb5@kernel.org>
 <03f7dc73-3e7c-1e6d-275f-85539493cd7f@intel.com>
 <CAPAtJa8qupPZZ0AiMWSxNKSd-WMg0MQDQeZcCO_Z-GGBu3jZCg@mail.gmail.com>
 <CAPAtJa_-yMusW5-C3BDivMu=MOyfKF9VQkxQotX3L_P+Q48oMA@mail.gmail.com>
 <CAPAtJa_nL5edyiN61ghXZxVUSDBFQQR3uiYJM0uo9mEao=RC0w@mail.gmail.com>
 <CAPAtJa_hbFbVXQbiNnb_byLqtZ-Dy_EBcvTFH9GyPqt__dFmLQ@mail.gmail.com>
 <Y3gKkYeijrAIhxjc@spud> <20221118145443.427ecf10@kernel.org>
 <Y3gTdsg4l71L0vz9@spud>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <Y3gTdsg4l71L0vz9@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1668941492;0723fae5;
X-HE-SMSGID: 1owhcr-00035t-Kz

On 19.11.22 00:21, Conor Dooley wrote:
> On Fri, Nov 18, 2022 at 02:54:43PM -0800, Jakub Kicinski wrote:
>> On Fri, 18 Nov 2022 22:43:29 +0000 Conor Dooley wrote:
>>>> Is there any update for the community? More and more folks are asking. We
>>>> are all techies and happy to help debug.  
>>>
>>> Vested interest since I am suffering from the same issue (X670E-F
>>> Gaming), but is it okay to add this to regzbot? Not sure whether it
>>> counts as a regression or not since it's new hw with the existing driver,
>>> but this seems to be falling through the cracks without a response for
>>> several weeks.
>>
>> Dunno, Thorsten's will decide. The line has to be drawn somewhere
>> on "vendor doesn't care about Linux support" vs "we broke uAPI".
>> This is the kind of situation I was alluding to in my line of
>> questioning at the maintainer summit: https://lwn.net/Articles/908324/
> 
> Yeah & it is /regression/ tracking which I don't (or rather didn't)
> consider this situation to be.

Yeah, looks like this is not something that look track-worthy for
regzbot -- at least for now, maybe it one day makes sense to use and
improved regzbot for bug reports as well, but I'd like to focus on
establishing regression tracking properly first, which still requires a
lot of work.

> I'm generally a little unsure as to when
> I should trigger regzbot in general:
> - immediately when I find something?

Yes, ideally, as documented here:
https://docs.kernel.org/admin-guide/reporting-regressions.html

> - only if it goes a while with nothing constructive?

But that is fine as well. But FWIW, we all don't want bureaucracy. Even
I don't add each and every regression I see to the tracking yet.

> - is it okay to use it outside of "this used to work and now doesnt"?

Guess I should clarify that this is unwanted in above doc.

Ciao, Thorsten
