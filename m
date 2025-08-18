Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381182F0680
	for <regressions@lists.linux.dev>; Mon, 18 Aug 2025 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505779; cv=none; b=VHa/c7tSfB4h+zgJVtjvMKy+AqPlnAm5PhWEaaBOTRv792FZdB2ttOF66VlKLwSo9MlUrvwYW7YY2xDyZkjryB9jLgVfFxluDa5aeAdeCLiN7rFOAWs0siCJJraf5nE9xzbaBj8IGNqm7W7thuJkfmwO4fRO9q+Ls2oaMCKIkj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505779; c=relaxed/simple;
	bh=96X8sKpNax+WJ9tYYMzQEYkIxk8bXLiL55v2G3dCRJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hbSPG932IWjRRRBjPKmipdZZ35KtbPv8zFypPLo2515M7WEMG9KWAcwEh5z4RNtkKm6bVpz6i5MTLjulMAaqGWV+0wSamUb9gNK7EWVJN3vemnU2EzzKcm8vhVCKFQtwMfzjRacOBRSZX9UnFG8QmDW4yy77QIxrimW+V/kUh8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w011.hihonor.com (unknown [10.68.20.122])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4c55V7131fzYl4S6;
	Mon, 18 Aug 2025 16:29:19 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 18 Aug
 2025 16:29:29 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 18 Aug
 2025 16:29:29 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jirislaby@kernel.org>
CC: <adobriyan@gmail.com>, <akpm@linux-foundation.org>, <ast@kernel.org>,
	<gregkh@linuxfoundation.org>, <k.shutemov@gmail.com>, <polynomial-c@gmx.de>,
	<regressions@lists.linux.dev>, <rick.p.edgecombe@intel.com>,
	<stable@vger.kernel.org>, <viro@zeniv.linux.org.uk>, <wangzijie1@honor.com>
Subject: Re: [PATCH] proc: fix wrong behavior of FMODE_LSEEK clearing for net related proc file
Date: Mon, 18 Aug 2025 16:29:29 +0800
Message-ID: <20250818082929.846020-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6b4debbf-028d-49e0-858f-dc72b37948c7@kernel.org>
References: <6b4debbf-028d-49e0-858f-dc72b37948c7@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: w012.hihonor.com (10.68.27.189) To a011.hihonor.com
 (10.68.31.243)

>k.shutemov no longer @ intel -> use gmail.
>
>On 18. 08. 25, 10:08, Jiri Slaby wrote:
>> On 18. 08. 25, 10:01, wangzijie wrote:
>>>> Hi,
>>>>
>>>> On 18. 08. 25, 6:05, wangzijie wrote:
>>>>> For avoiding pde->proc_ops->... dereference(which may cause UAF in 
>>>>> rmmod race scene),
>>>>> we call pde_set_flags() to save this kind of information in PDE 
>>>>> itself before
>>>>> proc_register() and call pde_has_proc_XXX() to replace pde- 
>>>>> >proc_ops->... dereference.
>>>>> But there has omission of pde_set_flags() in net related proc file 
>>>>> create, which cause
>>>>> the wroing behavior of FMODE_LSEEK clearing in proc_reg_open() for 
>>>>> net related proc file
>>>>> after commit ff7ec8dc1b64("proc: use the same treatment to check 
>>>>> proc_lseek as ones for
>>>>> proc_read_iter et.al"). Lars reported it in this link[1]. So call 
>>>>> pde_set_flags() when
>>>>> create net related proc file to fix this bug.
>>>>
>>>> I wonder, why is pde_set_flags() not a part of proc_register()?
>>>
>>> Not all proc_dir_entry have proc_ops, so you mean this will be a 
>>> better modification?
>>>
>>> diff --git a/fs/proc/generic.c b/fs/proc/generic.c
>>> index 76e800e38..d52197c35 100644
>>> --- a/fs/proc/generic.c
>>> +++ b/fs/proc/generic.c
>>> @@ -367,6 +367,20 @@ static const struct inode_operations 
>>> proc_dir_inode_operations = {
>>>          .setattr        = proc_notify_change,
>>>   };
>>>
>>> +static void pde_set_flags(struct proc_dir_entry *pde)
>>> +{
>>> +       if (pde->proc_ops->proc_flags & PROC_ENTRY_PERMANENT)
>>> +               pde->flags |= PROC_ENTRY_PERMANENT;
>>> +       if (pde->proc_ops->proc_read_iter)
>>> +               pde->flags |= PROC_ENTRY_proc_read_iter;
>>> +#ifdef CONFIG_COMPAT
>>> +       if (pde->proc_ops->proc_compat_ioctl)
>>> +               pde->flags |= PROC_ENTRY_proc_compat_ioctl;
>>> +#endif
>>> +       if (pde->proc_ops->proc_lseek)
>>> +               pde->flags |= PROC_ENTRY_proc_lseek;
>>> +}
>>> +
>>>   /* returns the registered entry, or frees dp and returns NULL on 
>>> failure */
>>>   struct proc_dir_entry *proc_register(struct proc_dir_entry *dir,
>>>                  struct proc_dir_entry *dp)
>>> @@ -374,6 +388,9 @@ struct proc_dir_entry *proc_register(struct 
>>> proc_dir_entry *dir,
>>>          if (proc_alloc_inum(&dp->low_ino))
>>>                  goto out_free_entry;
>>>
>>> +       if (dp->proc_ops)
>
>And to be honest, I would possibly move the 'if' into pde_set_flags().
>
>>> +               pde_set_flags(dp);
>
>As here, it is not completely clear why you would want to test 
>"dp->proc_ops" for something called "pde_set_flags".
>
>-- 
>js
>suse labs

Thank you for all suggestions, it makes sense to me. Let me submit the
next version patch.

