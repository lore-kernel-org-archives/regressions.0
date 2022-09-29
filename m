Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E0810F7
	for <regressions@lists.linux.dev>; Thu, 29 Sep 2022 07:07:36 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1odndu-0003bE-3P; Thu, 29 Sep 2022 09:07:34 +0200
Message-ID: <828c7a9b-66b7-c936-a79a-91d43eaa4a9a@leemhuis.info>
Date: Thu, 29 Sep 2022 09:07:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: linux-5.15.69 breaks nfs client #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-nfs
 <linux-nfs@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
References: <f6755107-b62c-a388-0ab5-0a6633bf9082@garloff.de>
 <d9a3460b-0ed6-4bfa-5bdd-032f4bc4ebce@leemhuis.info>
In-Reply-To: <d9a3460b-0ed6-4bfa-5bdd-032f4bc4ebce@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1664435256;93d0261b;
X-HE-SMSGID: 1odndu-0003bE-3P

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 23.09.22 09:46, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker. CCing the regression
> mailing list, as it should be in the loop for all regressions, as
> explained here:
> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
> Also CCing the stable ml, the NFS maintainers, and the authors of
> 31b992b3c39b, too.
> 
> On 22.09.22 23:46, Kurt Garloff wrote:
>>
>> a freshly compiled 5.15.69 kernel showed hangs with NFS.
>> Typically mkdir would end up in a 'D' process state, but I
>> have seen ls -l hanging as well.
>> Server is kernel NFS 5.15.69.
>>
>> After reverting the last three NFS related commits,
>> a68a734b19af NFS: Fix WARN_ON due to unionization of nfs_inode.nrequests
>> 3b97deb4abf5 NFS: Fix another fsync() issue after a server reboot
>> 31b992b3c39b NFS: Save some space in the inode
>>
>> things work normally again.
>>
>> As you can see, I suspected 31b992b3c39b ...
> 
> FWIW, that's e591b298d7ec in mainline.
> 
>> I know this report is light on details; if nothing like this has been
>> reported yet, let me know and I'll try to find some time to investigate
>> further.
>>
>> PS: Please keep me on Cc, I'm not subscribed to linux-nfs.
> 
> [...]
> 
> #regzbot ^introduced 31b992b3c39b
> #regzbot ignore-activity

#regzbot fixed-by: 27bf7a5d11987
