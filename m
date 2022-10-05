Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B80463C;
	Wed,  5 Oct 2022 09:00:55 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1og0Gr-0006G8-NF; Wed, 05 Oct 2022 11:00:53 +0200
Message-ID: <89926f21-e172-9f3d-d08f-8d5eef812ee1@leemhuis.info>
Date: Wed, 5 Oct 2022 11:00:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, de-DE
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, ksummit <ksummit@lists.linux.dev>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
 <c74d9d75-4428-e22d-1adb-334b1173d871@leemhuis.info>
 <20221004202540.etokkm3jk6sk7z7y@meerkat.local>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
In-Reply-To: <20221004202540.etokkm3jk6sk7z7y@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1664960456;19817fd4;
X-HE-SMSGID: 1og0Gr-0006G8-NF

On 04.10.22 22:25, Konstantin Ryabitsev wrote:
> On Tue, Oct 04, 2022 at 10:06:28PM +0200, Thorsten Leemhuis wrote:
>> Your plan would afaics mean that we invest further into a software
>> abandoned by its upstream and already becoming more and more of a
>> maintenance burden. That investment would also further increase our
>> dependency on that software by establishing workflows that rely on it.
>> Is that really wise at this point? Wouldn't it be better to spend that
>> time and effort to build something better that is more future proof?
> 
> Unfortunately, there's no such thing. ;) And maybe we'll even help tip the
> course of history into the other direction -- Red Hat uses bugzilla, and so
> does OpenSuse, so there's a pretty good core of well-funded companies that
> would be in a position to help keep bugzilla going if it's looking like the
> platform is still alive. Or that could all be wishful thinking and they'll all
> migrate to Jira or something equally horrible, who knows.

Well, Red Hat apparently is already in the process of migrating to Jira
in the long run:
https://lists.fedoraproject.org/archives/list/epel-devel@lists.fedoraproject.org/thread/U7TZRWXVUGBCHS6EBJIBSFAVPFUHHV7J/

To quote that mail from March:

```
As some of you may know, Red Hat has been using both Bugzilla and Jira
via issues.redhat.com for RHEL development for several years.  Our
intention is to move to using issues.redhat.com only for the major
RHEL releases after RHEL 9.
```

Ciao, Thorsten
